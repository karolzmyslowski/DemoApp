//
//  Environment.swift
//  DemoAppL
//
//  Created by Karol Zmysłowski on 29/05/2019.
//  Copyright © 2019 Karol. All rights reserved.
//

import Foundation

struct Environment {
    
    private enum PlistKey: String {
        case server_scheme
        case server_host
    }
    
    private static var infoDict: [String: Any] {
        return Bundle.main.infoDictionary!
    }
    
    static var serverURL: URL {
        let scheme = infoDict[PlistKey.server_scheme.rawValue]! as! String
        let host = infoDict[PlistKey.server_host.rawValue]! as! String
        let components = NSURLComponents()
        components.scheme = scheme
        components.host = host
        return components.url!
    }
}
