//
//  SwiftRouterProtocol.swift
//  SwiftRouterProtocol
//
//  Created by Jake Cai on 2019/8/2.
//  Copyright © 2019 Jake. All rights reserved.
//

import UIKit

public protocol Routable: NSObject {
    static func viewControllerWith(routePath: RouterProtocol.Path) -> UIViewController?
    static func handleURLString(_ urlString: String, routePath: RouterProtocol.Path) -> URL?
}

public struct RouterProtocol {
    
    public enum Path {
        public enum User {
            case login
            case profile(userID: String)
        }
        
        case user(User)
        case search
    }
}
