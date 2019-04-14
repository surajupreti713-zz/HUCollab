//
//  PopupViewController.swift
//  HUCollab
//
//  Created by Suraj Upreti on 4/12/19.
//  Copyright © 2019 Suraj Upreti. All rights reserved.
//

import UIKit

/* This view controller is used for posting posts to a Thread*/
class PopupViewController: UIViewController {
    
    @IBOutlet weak var titleTextfield: UITextField!
    @IBOutlet weak var descriptionTextField: UITextView!
    
    @IBAction func onCancelClicked(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    @IBAction func tapToPost(_ sender: UIButton) {
        
        self.removeAnimate()
    }
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }

    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    

}
