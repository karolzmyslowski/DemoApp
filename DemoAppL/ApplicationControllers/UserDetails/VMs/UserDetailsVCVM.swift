//
//  UserDetailsVCVM.swift
//  DemoAppL
//
//  Created by Karol Zmysłowski on 29/05/2019.
//  Copyright © 2019 Karol. All rights reserved.
//

import Foundation

final class UserDetailsVCVM: UserDetailsProtocol {
    
    // MARK: - Let
    let user: User
    
    // MARK: - Var
    var posts: [Post] = []
    var handleFinish: (() -> Void)?
    
    // MARK: - Delegate
    weak var delegate: UserDetailsVCDelegate?
    
    // MARK: - Init
    init(user: User) {
        self.user = user
        
        DataFetcher.shared.fetchPosts(for: user) { [weak self] posts, error in
            guard let self = self else { return }
            
            guard let posts = posts else { return }
            self.posts = posts
            self.delegate?.reloadAllRows()
        }
    }
    func getUser() -> User {
        return user
    }
    
    // MARK: - UserDetailsProtocol funntions
    func getPostsCount() -> Int {
        return posts.count
    }
    
    func getPost(for index: Int) -> Post {
        return posts[index]
    }
    
    func finish() {
        handleFinish?()
    }
}
