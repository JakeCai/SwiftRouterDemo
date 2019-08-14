//
//  ViewController.swift
//  MainMoudle
//
//  Created by Jake Cai on 2019/7/22.
//  Copyright © 2019 Jake. All rights reserved.
//

import UIKit
import SwiftRouter

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
        let btn = UIButton()
        btn.backgroundColor = .blue
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
        Router.presentTo(.user(.login), from: self, animated: true, completion: nil)
    }
}

