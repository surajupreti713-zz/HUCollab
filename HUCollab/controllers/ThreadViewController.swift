//
//  ThreadViewController.swift
//  HUCollab
//
//  Created by Suraj Upreti on 4/11/19.
//  Copyright © 2019 Suraj Upreti. All rights reserved.
//

import UIKit
import Firebase

/* This view controller contains all the posts of a particular thread */
class ThreadViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var threadImageView: UIImageView!
    
    @IBOutlet weak var threadLabel: UILabel!
    @IBOutlet weak var threadDescriptionLabel: UITextView!
    @IBOutlet weak var subscribeButton: UIButton!
    
    let databaseRef = Database.database().reference(withPath: "threads")
    var storageRef: StorageReference {
        return Firebase.Storage.storage().reference(withPath: "threadPhoto")
    }
    var userID: String {
        return Auth.auth().currentUser!.uid
    }
    var thread: Thread!
    
    @IBAction func notificationButton(_ sender: UIButton) {
        
    }
    
    @IBAction func homeButtonClicked(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "homeViewController") as! HomeViewController
        let navigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: true, completion: nil)
    }
    
    @IBAction func addPostClicked(_ sender: UIBarButtonItem) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PopupViewController") as! PopupViewController
        self.addChild(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParent: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        databaseRef.observe(.value) { snapshot in
            var threads = [Thread]()
            for snap in snapshot.children {
                let threadSnap = snap as! DataSnapshot
                /*if let value = threadSnap.value as? [String: Any] {
                    let snapID = value["userID"] as! String
                    if snapID == self.userID {
                        print("I am the man!!!!!")
                    }
                }*/
                self.thread = Thread(snapshot: threadSnap as! DataSnapshot)
                self.threadLabel.text = self.thread.threadHandle
                self.threadDescriptionLabel.text = self.thread.threadDescription
            }
            print(threads)
            
        }
    }
    
    /* Tableview delegate methods */
    /*func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }*/
    
}
