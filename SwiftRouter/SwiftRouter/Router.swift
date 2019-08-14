//
//  Router.swift
//  SwiftRouter
//
//  Created by Jake Cai on 2019/8/2.
//  Copyright © 2019 Jake. All rights reserved.
//

import UIKit
import SafariServices
import SwiftRouterProtocol

public struct RouteTarget {
    public let className: String
    public let urlString: String?
    
    public init(className: String, urlString: String? = nil) {
        self.className = className
        self.urlString = urlString
    }
}

public protocol RouterDelegate: class {
    func routeTargetWithPath(_ path: RouterProtocol.Path) -> RouteTarget?
}

public class Router {
    static private let shared = Router()
    private init() {
        
    }
    
    private weak var _delegate: RouterDelegate?
    public static var delegate: RouterDelegate? {
        set {
            Router.shared._delegate = newValue
        }
        get {
            return Router.shared._delegate
        }
    }
    
    static public func viewControllerWithPath(_ path: RouterProtocol.Path) -> UIViewController? {
        guard let target = Router.delegate?.routeTargetWithPath(path),
            let routableClass = NSClassFromString(target.className) as? Routable.Type  else {
                return nil
        }
        
        if let urlString = target.urlString,
            let url = routableClass.handleURLString(urlString, routePath: path) {
            return SFSafariViewController(url: url)
        }
        
        return routableClass.viewControllerWith(routePath: path)
    }
    
    static public func pushTo(_ path: RouterProtocol.Path,
                              from target: UIViewController,
                              animated: Bool) {
        guard let vc = viewControllerWithPath(path) else {
            return
        }
        if vc is SFSafariViewController {
            target.present(vc, animated: animated, completion: nil)
        }
        else {
            target.navigationController?.pushViewController(vc, animated: animated)
        }
    }
    
    static public func presentTo(_ path: RouterProtocol.Path,
                                 from target: UIViewController,
                                 animated: Bool,
                                     completion:(() -> ())?) {
        guard let vc = viewControllerWithPath(path) else {
            return
        }
        target.present(vc, animated: animated, completion: completion)
    }
}
