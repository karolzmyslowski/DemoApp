//
//  CustomNavigationController.swift
//  DemoAppL
//
//  Created by Karol Zmysłowski on 28/05/2019.
//  Copyright © 2019 Karol. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.tintColor = .white
        navigationBar.barTintColor = UIColor.mainBlue
        navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont(name: "Raleway-Regular", size: 17.0) ?? UIFont.systemFont(ofSize: 47.0)
        ]
    }
}
