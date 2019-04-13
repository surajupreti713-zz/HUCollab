//
//  Post.swift
//  HUCollab
//
//  Created by Suraj Upreti on 4/12/19.
//  Copyright © 2019 Suraj Upreti. All rights reserved.
//

import UIKit

struct Post {
    var createdBy: String?
    var postTitle: String?
    var postDescription: String?
    var numberOfUpvotes: Int?
    var numberOfComments: Int?
    var numberOfShares: Int?
    var image: UIImage?  //this should be the image of the thread to which this post belongs to
    
    static func fetchPosts() -> [Post] {
        var posts = [Post]()
        let post1 = Post(createdBy: "Suraj Upreti", postTitle: "Volunteers needed for Tutoring", postDescription: "We are in need of some helping hands. We would really appreciate if there are people who want to help us.", numberOfUpvotes: 5, numberOfComments: 10, numberOfShares: 2, image: UIImage(named: "cs"))
        let post2 = Post(createdBy: "Shrijan Aryal", postTitle: "Campaigning for Hillary Clinton", postDescription: "Are there people interested in campaigning. We would really appreciate if there are people who want to help us.", numberOfUpvotes: 5, numberOfComments: 10, numberOfShares: 2, image: UIImage(named: "cs"))
        let post3 = Post(createdBy: "Prashant Bhandari", postTitle: "Assignments posted for Computer Science", postDescription: "We are in need of some helping hands. We would really appreciate if there are people who want to help us.", numberOfUpvotes: 5, numberOfComments: 10, numberOfShares: 2, image: UIImage(named: "cs"))
        let post4 = Post(createdBy: "Sumnima Joshi", postTitle: "Volunteers needed for Tutoring", postDescription: "We are in need of some helping hands. We would really appreciate if there are people who want to help us.", numberOfUpvotes: 5, numberOfComments: 10, numberOfShares: 2, image: UIImage(named: "cs"))
        let post5 = Post(createdBy: "Michael Clark", postTitle: "Looking for a job", postDescription: "We are in need of some helping hands. We would really appreciate if there are people who want to help us.", numberOfUpvotes: 5, numberOfComments: 10, numberOfShares: 2, image: UIImage(named: "cs"))
        let post6 = Post(createdBy: "David Warner", postTitle: "Volunteers needed for Tutoring", postDescription: "We are in need of some helping hands. We would really appreciate if there are people who want to help us.", numberOfUpvotes: 5, numberOfComments: 10, numberOfShares: 2, image: UIImage(named: "cs"))
        
        posts.append(post1)
        posts.append(post2)
        posts.append(post3)
        posts.append(post4)
        posts.append(post5)
        posts.append(post6)
        
        return posts
    }
}
