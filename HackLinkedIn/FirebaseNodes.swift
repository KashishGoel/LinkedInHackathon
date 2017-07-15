//
//  FirebaseNodes.swift
//  HackLinkedIn
//
//  Created by Kashish Goel on 2017-07-15.
//  Copyright © 2017 Kashish Goel. All rights reserved.
//

import Foundation

class FirebaseNodes {
    static let businesses = FirebaseManager.ref.child("businesses")
    static let users = FirebaseManager.ref.child("users")
    static let requests = FirebaseNodes.businesses.child("requests")
}
