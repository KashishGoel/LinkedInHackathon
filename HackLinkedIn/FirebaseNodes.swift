//
//  FirebaseNodes.swift
//  HackLinkedIn
//
//  Created by Kashish Goel on 2017-07-15.
//  Copyright © 2017 Kashish Goel. All rights reserved.
//

import Foundation
import Firebase

class FirebaseNodes {
    
    static let businesses = FirebaseManager.ref.child("businesses")
    static let users = FirebaseManager.ref.child("users")
    static let requests = FirebaseManager.ref.child("requests")
    static let businessRequests = FirebaseNodes.businesses.child(FirebaseManager.currentUserID).child("requests")
    static let bought = FirebaseNodes.businesses.child(FirebaseManager.currentUserID).child("bought")
    static let images = FirebaseNodes.businesses.child(FirebaseManager.currentUserID).child("images")
    
}
