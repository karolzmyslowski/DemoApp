//
//  Post.swift
//  DemoAppL
//
//  Created by Karol Zmysłowski on 29/05/2019.
//  Copyright © 2019 Karol. All rights reserved.
//

import Foundation

// MARK: - Post
struct Post: Codable {
    let userId, id: Int
    let title, body: String
}
