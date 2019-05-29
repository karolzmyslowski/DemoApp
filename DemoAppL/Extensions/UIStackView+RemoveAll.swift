//
//  UIStackView+RemoveAll.swift
//  DemoAppL
//
//  Created by Karol Zmysłowski on 28/05/2019.
//  Copyright © 2019 Karol. All rights reserved.
//

import UIKit

extension UIStackView {
    
    func removeAllSubviews() {
        arrangedSubviews.forEach {
            removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
    }
}

