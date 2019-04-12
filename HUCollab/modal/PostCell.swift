//
//  PostCell.swift
//  HUCollab
//
//  Created by Suraj Upreti on 4/12/19.
//  Copyright © 2019 Suraj Upreti. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var threadNameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var postStatsLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    
    var post: Post! {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        threadNameLabel.text = post.postTitle
        usernameLabel.text = post.createdBy
        descriptionLabel.text = post.postDescription
        postImageView.image = post.image
        postStatsLabel.text = "\(post.numberOfUpvotes!) Upvotes     \(post.numberOfComments!) Comments     \(post.numberOfShares!) Shares"
    }
}
