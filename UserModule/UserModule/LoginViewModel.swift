//
//  LoginViewModel.swift
//  UserModule
//
//  Created by Jake Cai on 2019/8/14.
//  Copyright © 2019 Jake. All rights reserved.
//

import UIKit
import SwiftRouterProtocol

class LoginViewModel: NSObject, Routable {
    static func handleURLString(_ urlString: String, routePath: RouterProtocol.Path) -> URL? {
        return nil
    }
    
    
    static func viewControllerWith(routePath: RouterProtocol.Path) -> UIViewController? {
        switch routePath {
        case .user(let user):
            switch user {
            case .login:
                return LoginViewController()
            default:
                break
            }
        default:
            break
        }
        return nil
    }
}
