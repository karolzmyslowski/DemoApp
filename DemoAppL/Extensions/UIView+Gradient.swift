//
//  UIView+Gradient.swift
//  DemoAppL
//
//  Created by Karol Zmysłowski on 29/05/2019.
//  Copyright © 2019 Karol. All rights reserved.
//

import UIKit

extension UIView {
    
    func addBlackGradientLayerInForeground(colors: [UIColor]) {
        let gradient = CAGradientLayer()
        gradient.frame = self.frame
        gradient.colors = colors.map{ $0.cgColor }
        self.layer.addSublayer(gradient)
    }
}
