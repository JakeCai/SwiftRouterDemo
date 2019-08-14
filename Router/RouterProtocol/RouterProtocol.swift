//
//  RouterProtocol.swift
//  RouterProtocol
//
//  Created by Jake Cai on 2019/7/22.
//  Copyright © 2019 Jake. All rights reserved.
//

import UIKit

public protocol Routable: NSObject {
    static func viewControllerWith(routePath: RouterProtocol.Path) -> UIViewController?
    static func handleURLString(_ urlString: String, routePath: RouterProtocol.Path) -> URL?
}

public class RouterProtocol {
    public enum Path {
        public enum User {
            case login
            case profile(userName: String, password: String)
        }
        
        case user(User)
        case search
    }
}
