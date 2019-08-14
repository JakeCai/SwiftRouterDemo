//
//  UserViewController.swift
//  UserModule
//
//  Created by Jake Cai on 2019/8/2.
//  Copyright © 2019 Jake. All rights reserved.
//

import UIKit
import SwiftRouterProtocol

class UserViewController: UIViewController {
    private let userID: String
    init(userID: String) {
        self.userID = userID
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        label.text = userID
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            ])
        
    }
}
