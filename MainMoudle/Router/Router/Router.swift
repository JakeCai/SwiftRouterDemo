//
//  Router.swift
//  SwiftRouter
//
//  Created by Jake Cai on 2019/7/12.
//  Copyright © 2019 Jake. All rights reserved.
//

import UIKit
import SafariServices

public protocol Routable: NSObject {
    static func viewControllerWith(routePath: Router.Path) -> UIViewController?
    static func handleURLString(_ urlString: String, routePath: Router.Path) -> URL
}

public class Router {
    public enum Path {
        public enum User {
            case login
            case profile(userName: String, password: String)
        }
        
        case user(User)
        case search
    }
    
    static private let shared = Router()
    private init() {
        guard let routeMapURL = Bundle.main.url(forResource: "RouteMap", withExtension: "json") else {
            return
        }
        do {
            let data = try Data(contentsOf: routeMapURL)
            routeMap = try JSONDecoder().decode([String : [String : String]].self, from: data)
        }
        catch {
            
        }
    }
    
    
    private var routeMap = [String : [String : String]]()
    
    private func routeMapKeyForPath(_ path: Path) -> String {
        switch path {
        case .user(let userPath): do {
            switch userPath {
            case .login:
                return "login"
            case .profile(_, _):
                return "userProfile"
            }
        }
        case .search:
            return "search"
        }
    }
    
    static public func viewControllerForPath(_ path: Path) -> UIViewController? {
        let key = Router.shared.routeMapKeyForPath(path)
        
        guard let value = Router.shared.routeMap[key],
            let className = value["class"] else {
            return nil
        }
        
        if let routableClass = NSClassFromString(className).self as? Routable.Type {
            if let urlString = value["url"] {
                let url = routableClass.handleURLString(urlString, routePath: path)
                let webVC = SFSafariViewController(url: url)
                return webVC
            } else if let vc = routableClass.viewControllerWith(routePath: path) {
                return vc
            }
        }
        return nil
    }
    
    static public func pushToPath(_ path: Path,
                                  from target: UIViewController,
                                  animated: Bool) {
        guard let vc = viewControllerForPath(path) else {
            return
        }
        if vc is SFSafariViewController {
            target.present(vc, animated: animated, completion: nil)
            return
        }
        target.navigationController?.pushViewController(vc, animated: animated)
    }
    
    static public func presentToPath(_ path: Path,
                                     from target: UIViewController,
                                     animated: Bool,
                                     completion:(() -> ())?) {
        guard let vc = viewControllerForPath(path) else {
            return
        }
        if vc is SFSafariViewController {
            target.present(vc, animated: animated, completion: completion)
            return
        }
        target.present(vc, animated: animated, completion: completion)
    }
}
