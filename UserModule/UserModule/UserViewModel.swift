//
//  UserViewModel.swift
//  UserModule
//
//  Created by Jake Cai on 2019/8/14.
//  Copyright © 2019 Jake. All rights reserved.
//

import UIKit
import SwiftRouterProtocol

public class UserModule: NSObject {
    @objc public static func registerClass() {
        let _ = UserViewModel.self
        let _ = LoginViewController.self
    }
}

class UserViewModel: NSObject, Routable {
    public static func handleURLString(_ urlString: String, routePath: RouterProtocol.Path) -> URL? {
        return nil
    }
    
    static func viewControllerWith(routePath: RouterProtocol.Path) -> UIViewController? {
        switch routePath {
        case .user(let user):
            switch user {
            case .profile(let userID):
                return UserViewController(userID: userID)
            default:
                break
            }
        default:
            break
        }
        return nil
    }
}
