//
//  Thread.swift
//  HUCollab
//
//  Created by Suraj Upreti on 4/10/19.
//  Copyright © 2019 Suraj Upreti. All rights reserved.
//

import Foundation
import Firebase

public class Thread {
    var threadHandle: String?
    var threadDescription: String?
    //var threadPhotoURL: String?
    var created: String?
    var userEmail: String?
    var userID: String?
    var threadID: String?
    
    init(threadHandle: String, threadDescription: String, created: String, userEmail: String, userID: String, threadID: String) {
        self.threadHandle = threadHandle
        self.threadDescription = threadDescription
        //self.threadPhotoURL = threadPhotoURL
        self.created = created
        self.userEmail = userEmail
        self.userID = userID
        self.threadID = threadID
    }
    
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String: AnyObject],
            let threadHandle = value["threadHandle"] as? String,
            let threadDescription = value["threadDescription"] as? String,
            let created = value["created"] as? String,
            let userEmail = value["userEmail"] as? String,
            let userID = value["userID"] as? String,
            let threadID = value["threadID"] as? String
        
            else {
                return nil
        }
        
        self.threadHandle = threadHandle
        self.threadDescription = threadDescription
        self.created = created
        self.userEmail = userEmail
        self.userID = userID
        self.threadID = threadID
    }
    
    func toAnyObject() -> Any {
        return [
            "threadHandle": threadHandle,
            "threadDescription": threadDescription,
            "created": created,
            "userEmail": userEmail,
            "userID": userID,
            "threadID": threadID
        ]
    }
}
