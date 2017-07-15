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
    
    static func createAccount(name:String, email:String, pass:String, userType:UserType) {
        FIRAuth.auth()?.createUser(withEmail: email, password: pass, completion: { (user, err) in
            if err != nil {
                print(err.debugDescription)
            }
            
            if let user = user {
                if userType == .business {
                    FirebaseNodes.businesses.child(user.uid).setValue(["name": name, "id":UUID().uuidString])
                } else {
                    FirebaseNodes.users.child(user.uid).setValue(["name": name, "id":UUID().uuidString])
                }
            }
        })
    }
    
    private func signIn(name:String, email:String, pass:String, userType:UserType){
        FIRAuth.auth()?.signIn(withEmail: email, password: pass) { (user, error) in
            let changeRequest = FIRAuth.auth()?.currentUser?.profileChangeRequest()
            
            changeRequest?.displayName = name
            changeRequest?.commitChanges(completion: { (err) in
                if (err != nil) {
                    print(err.debugDescription)
                }
            })
        }
    }
    
    private func createAuctionRequest(description:String, image:URL, makePublic:Bool, trawl:Bool, price:Int,tags:[Tag]) {
        let data: [String:Any] = [
            "description":description,
            "image": image,
            "public": makePublic,
            "trawl": trawl,
            "price": price,
            "tags": tags
        ]
        FirebaseNodes.requests.child(UUID().uuidString).setValue(data)
    }
}

