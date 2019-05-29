//
//  MainScreenProtocol.swift
//  DemoAppL
//
//  Created by Karol Zmysłowski on 29/05/2019.
//  Copyright © 2019 Karol. All rights reserved.
//

import Foundation

protocol MainScreenProtocol {
    
    var delegate: MainVCDelegate? { get set }
    
    func getUsersCount() -> Int
    func getUser(for index: Int) -> User
    func selectUser(at index: Int)
}
