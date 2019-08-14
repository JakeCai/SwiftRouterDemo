//
//  SearchViewModel.swift
//  SearchModule
//
//  Created by Jake Cai on 2019/8/14.
//  Copyright © 2019 Jake. All rights reserved.
//

import UIKit
import SwiftRouterProtocol

public class SearchModule: NSObject {
    @objc public static func registerClass() {
        let _ = SearchViewModel.self
    }
}

class SearchViewModel: NSObject, Routable {
    
    static func handleURLString(_ urlString: String, routePath: RouterProtocol.Path) -> URL? {
        return URL(string: urlString)
    }
    
    static func viewControllerWith(routePath: RouterProtocol.Path) -> UIViewController? {
        switch routePath {
        case .search:
            return SearchViewController()
        default:
            break
        }
        return nil
    }

}
