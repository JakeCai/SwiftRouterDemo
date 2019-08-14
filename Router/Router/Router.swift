//
//  Router.swift
//  Router
//
//  Created by Jake Cai on 2019/7/22.
//  Copyright © 2019 Jake. All rights reserved.
//
import UIKit
import SafariServices
import RouterProtocol

public class Router {
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
    
    private func routeMapKeyForPath(_ path: RouterProtocol.Path) -> String {
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
    
    static public func viewControllerWithPath(_ path: RouterProtocol.Path) -> UIViewController? {
        let key = Router.shared.routeMapKeyForPath(path)
        
        guard let value = Router.shared.routeMap[key],
            let className = value["class"],
            let routableClass = NSClassFromString(className) as? Routable.Type  else {
                return nil
        }
        
        if let urlString = value["url"],
            let url = routableClass.handleURLString(urlString, routePath: path) {
            let webVC = SFSafariViewController(url: url)
            return webVC
        }
        else if let vc = routableClass.viewControllerWith(routePath: path) {
            return vc
        }
        
        return nil
    }
    
    static public func pushToPath(_ path: RouterProtocol.Path,
                                  from target: UIViewController,
                                  animated: Bool) {
        guard let vc = viewControllerWithPath(path) else {
            return
        }
        if vc is SFSafariViewController {
            target.present(vc, animated: animated, completion: nil)
            return
        }
        target.navigationController?.pushViewController(vc, animated: animated)
    }
    
    static public func presentToPath(_ path: RouterProtocol.Path,
                                     from target: UIViewController,
                                     animated: Bool,
                                     completion:(() -> ())?) {
        guard let vc = viewControllerWithPath(path) else {
            return
        }
        if vc is SFSafariViewController {
            target.present(vc, animated: animated, completion: completion)
            return
        }
        target.present(vc, animated: animated, completion: completion)
    }
}

