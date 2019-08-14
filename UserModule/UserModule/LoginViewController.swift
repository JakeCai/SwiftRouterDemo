//
//  LoginViewController.swift
//  UserModule
//
//  Created by Jake Cai on 2019/8/2.
//  Copyright © 2019 Jake. All rights reserved.
//

import UIKit
import SwiftRouter
import SwiftRouterProtocol

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        let btn = UIButton()
        btn.backgroundColor = .black
        btn.addTarget(self, action: #selector(click), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(btn)
        
        NSLayoutConstraint.activate([
            btn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btn.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            btn.widthAnchor.constraint(equalToConstant: 50),
            btn.heightAnchor.constraint(equalToConstant: 50),
            ])
    }
    
    @IBAction private func click() {
        Router.presentTo(.search, from: self, animated: true, completion: nil)
    }
}
