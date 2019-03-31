//
//  ViewController.swift
//  HUCollab
//
//  Created by Suraj Upreti on 3/28/19.
//  Copyright © 2019 Suraj Upreti. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
   /* The handler for the auth state listener, to allow cancelling later */
    var handle: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // [Start auth_listener]
        handle = Auth.auth().addStateDidChangeListener({ (auth, user) in
            
        })
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Auth.auth().removeStateDidChangeListener(handle!)   // [END remove_auth_listener]
    }
}

