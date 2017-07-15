//
//  Firebase.swift
//  HackLinkedIn
//
//  Created by Kashish Goel on 2017-07-14.
//  Copyright © 2017 Kashish Goel. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

class FirebaseManager {
    static var ref: FIRDatabaseReference {
        return FIRDatabase.database().reference()
    }
    
    static func createAccount(name:String, email:String, pass:String, userType:UserType ) {
        FIRAuth.auth()?.createUser(withEmail: email, password: pass, completion: { (user, err) in
            if err != nil {
                print(err.debugDescription)
            }
            
            if let user = user {
                if userType == .business {
                    FirebaseManager.ref.child("businesses").child(user.uid).setValue(["name": name, "id":UUID().uuidString])
                } else {
                    FirebaseManager.ref.child("users").child(user.uid).setValue(["name": name, "id":UUID().uuidString])
                }
            }
        })
    }
}

