//
//  UITableView+RegisterCells.swift
//  DemoAppL
//
//  Created by Karol Zmysłowski on 28/05/2019.
//  Copyright © 2019 Karol. All rights reserved.
//

import UIKit

extension UITableView {
    
    func registerCellClasses(_ cellClasses: [Identifiable.Type]) {
        cellClasses.forEach { register($0, forCellReuseIdentifier: $0.identifier) }
    }
    
    func dequeueReusableCell<T: UITableViewCell>() -> T where T: Identifiable {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier) as? T else {
            fatalError("Could not dequeue table view cell with identifier \(T.identifier)")
        }
        
        return cell
    }
}
