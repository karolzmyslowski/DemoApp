//
//  ImageViewWithGradient.swift
//  DemoAppL
//
//  Created by Karol Zmysłowski on 29/05/2019.
//  Copyright © 2019 Karol. All rights reserved.
//

import UIKit

class ImageViewWithGradient: UIImageView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addBlackGradientLayerInForeground(colors: [UIColor.topGradient, UIColor.botGradient])
    }
}
