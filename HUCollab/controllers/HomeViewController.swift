//
//  HomeViewController.swift
//  HUCollab
//
//  Created by Suraj Upreti on 3/29/19.
//  Copyright © 2019 Suraj Upreti. All rights reserved.
//

import UIKit
import Firebase
/* This view controller acts as a homepage and contains posts of threads that you are subscribed to */
class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    let transition = SlideInTransition()
    var topView: UIView?
    var posts: [Post]?
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        fetchPosts()
    }
    
    @IBAction func didTapMenu(_ sender: UIBarButtonItem) {
        guard let menuViewController = storyboard?.instantiateViewController(withIdentifier: "MenuViewController")
            as? MenuViewController else { return }
        menuViewController.didTapMenuType = { menuType in
            print(menuType)
            self.transitionToNew(menuType)
        }
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        present(menuViewController, animated: true)
        
    }
    
    func fetchPosts() {
        posts = Post.fetchPosts()
        self.tableView.reloadData()
    }
    
    func transitionToNew(_ menuType: MenuType) {
        let title = String(describing: menuType).capitalized
        self.title = title
        
        topView?.removeFromSuperview()
        switch menuType {
        case .createPost:
            
            let view = UIView()
            view.backgroundColor = .yellow
            view.frame = self.view.bounds
            self.view.addSubview(view)
            self.topView = view
        case .signout:
            logOut()
        default:
            break
        }
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        }
        catch let signOutError as NSError {
            print("Error signning out: %@", signOutError)
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initial = storyboard.instantiateInitialViewController()
        UIApplication.shared.keyWindow?.rootViewController = initial
    }
    
    /* Tableview datasource methods */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let posts = posts {
            return posts.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        
        cell.post = posts![indexPath.row]
        
        return cell
    }
    
    /* Tableview delegate methods */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row is clicked!")
    }
}

extension HomeViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
    
}
