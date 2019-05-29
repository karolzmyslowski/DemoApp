//
//  UserDetailsProtocol.swift
//  DemoAppL
//
//  Created by Karol Zmysłowski on 29/05/2019.
//  Copyright © 2019 Karol. All rights reserved.
//

import Foundation

protocol UserDetailsProtocol {
    
    var delegate: UserDetailsVCDelegate? { get set }
    
    func getUser() -> User
    func getPostsCount() -> Int
    func getPost(for index: Int) -> Post
    
    func finish()
}
