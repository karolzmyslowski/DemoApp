//
//  MainCoordinator.swift
//  DemoAppL
//
//  Created by Karol Zmysłowski on 28/05/2019.
//  Copyright © 2019 Karol. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    
    // MARK: Var
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    // MARK: Initialization
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: Functions
    func start() {
        let mainViewModel = MainVCVM()
        mainViewModel.handleSelectUser = { [weak self] user in
            self?.presentUserDetailsVC(user: user)
        }
        
        let vc = MainVC(viewModel: mainViewModel)
        navigationController.pushViewController(vc, animated: false)
    }
    
    private func presentUserDetailsVC(user: User) {
        let userDetailsViewModel = UserDetailsVCVM(user: user)
        userDetailsViewModel.handleFinish = { [weak self] in
            self?.navigationController.dismiss(animated: true)
        }
        let vc = UserDetailsVC(viewModel: userDetailsViewModel)
        navigationController.present(vc, animated: false)
    }
}
