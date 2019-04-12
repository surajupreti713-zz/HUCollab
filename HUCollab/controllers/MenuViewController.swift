//
//  MenuViewController.swift
//  HUCollab
//
//  Created by Suraj Upreti on 3/31/19.
//  Copyright © 2019 Suraj Upreti. All rights reserved.
//

import UIKit

enum MenuType: Int {
    case home
    case profile
    case signout
}

/* view controller for displaying side menu */
class MenuViewController: UITableViewController {
    
    var didTapMenuType: ((MenuType) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuType = MenuType(rawValue: indexPath.row) else { return }
        dismiss(animated: true) { [weak self] in
            print("Dismissing: \(menuType)")
            self?.didTapMenuType?(menuType)
        }
    }
    
}
