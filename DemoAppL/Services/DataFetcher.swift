//
//  DataFetcher.swift
//  DemoAppL
//
//  Created by Karol Zmysłowski on 28/05/2019.
//  Copyright © 2019 Karol. All rights reserved.
//

import Foundation

class DataFetcher {
    
    static let shared = DataFetcher()
    private init() {}
    
    private let mainUrl = Environment.serverURL.absoluteString
    
    func fetchUsers(completion: @escaping ([User]?, Error?) -> Void) {
        let url = mainUrl + "/users"
        
        genericGetFetcher(urlString: url) { completion($0, $1) }
    }
    
    func fetchPosts(for user: User, completion: @escaping ([Post]?, Error?) -> Void) {
        let url = mainUrl + "/posts?userId=\(user.id)"
        
        genericGetFetcher(urlString: url) { completion($0, $1) }
    }

    private func genericGetFetcher<T: Codable>(urlString: String, completion: @escaping (T?, Error?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil, FetcherError.wrongURL)
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                completion(nil, error)
                return
            }
            guard let data = data else {
                completion(nil, FetcherError.wrongData)
                return
            }
            
            do {
                let model = try JSONDecoder().decode(T.self, from: data)
                completion(model, nil)
            } catch let err {
                completion(nil, err)
            }
        }.resume()
    }
}

// MARK: - Error
extension DataFetcher {
    
    enum FetcherError: Error {
        case wrongURL
        case wrongData
    }
}
