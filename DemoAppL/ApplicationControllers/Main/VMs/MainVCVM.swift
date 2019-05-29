//
//  MainVCVM.swift
//  DemoAppL
//
//  Created by Karol Zmysłowski on 28/05/2019.
//  Copyright © 2019 Karol. All rights reserved.
//

import Foundation

final class MainVCVM: MainScreenProtocol {
    
    // MARK: - Private var
    private var users: [User] = []
    
    // MARK: - Var
    var handleSelectUser: ((User) -> Void)?
    
    // MARK: - Delegate
    weak var delegate: MainVCDelegate?
    
    // MARK: - Init
    init() {
        DataFetcher.shared.fetchUsers { [weak self] users, error in
            guard let self = self else { return }
            
            guard let users = users else { return }
            self.users = users
            self.delegate?.reloadAllRows()
        }
    }
    
    // MARK: - MainScreenProtocol funntions
    func getUsersCount() -> Int {
        return users.count
    }
    
    func getUser(for index: Int) -> User {
        return users[index]
    }
    
    func selectUser(at index: Int) {
        let user = getUser(for: index)
        handleSelectUser?(user)
    }
}
