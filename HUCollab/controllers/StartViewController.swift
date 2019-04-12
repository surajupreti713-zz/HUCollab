//
//  StartViewController.swift
//  HUCollab
//
//  Created by Suraj Upreti on 3/29/19.
//  Copyright © 2019 Suraj Upreti. All rights reserved.
//

import UIKit
import Firebase

/* The beginning page of the app where you choose to either sign in or sign up */
class StartViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Auth.auth().currentUser != nil {
            self.performSegue(withIdentifier: "alreadyLoggedIn", sender: self)
        }
    }
    
}
