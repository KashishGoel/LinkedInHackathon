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
    static var currentUserID: String {
        get {
            if let currentUser = FIRAuth.auth()?.currentUser {
                return currentUser.uid
            }
            return UUID().uuidString
        }
    }
    
    static var currentUserType: UserType? = nil
    
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
                currentUserType = userType
                print(currentUserType)
            }
        })
    }
    
    static func signIn(name:String, email:String, pass:String, userType:UserType){
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
    
    static func createAuctionRequest(description:String, image:String, makePublic:Bool, trawl:Bool, price:Int,tags:[String]) {
        let data: [String:Any] = [
            "description":description,
            "image": image,
            "public": makePublic,
            "trawl": trawl,
            "price": price,
            "tags": tags
        ]
        let request = FirebaseNodes.businessRequests.childByAutoId()
        request.setValue(data)
        
        FirebaseNodes.requests.child(request.key).setValue(data)
    }
    
    static func createBoughtItem(date:Int, image: String, price:Int, seller:[String:Any]){
        let data:[String:Any] = [
            "date":date,
            "image":image,
            "price":price,
            "seller":seller
        ]
        
        FirebaseNodes.bought.childByAutoId().setValue(data)
    }
    
    static func addImageToUserPortfolio(date:Int,id:Int,tags:[String],url:String) {
        let data:[String:Any] = [
            "date": date,
            "id": id,
            "tags":tags,
            "url":url
        ]
        
        FirebaseNodes.images.childByAutoId().setValue(data)
    }
    
    static func getBusinessRequests() -> [Request] {
        let userID = FirebaseManager.currentUserID
        var requests:[Request] = []
        FirebaseNodes.requests.observeSingleEvent(of: .value, with: { (snapshot) in
            if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                for snap in snapshots {
                    if let requestDictionary = snap.value as? Dictionary <String,AnyObject> {
                        let request = Request(requestDictionary: requestDictionary)
                        requests.append(request)
                    }
                }
            }
        }) { (error) in
            print(error.localizedDescription)
        }
        return requests
    }
    
    static func getRequests() {
        var requests:[Request] = []
        let userID = FirebaseManager.currentUserID
        FirebaseNodes.businesses.observeSingleEvent(of: .value, with: { (snapshot) in
            if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                print(snapshots)
                for snap in snapshots {
                    if let requestDictionary = snap.value as? Dictionary <String, AnyObject> {
                        let request = Request(requestDictionary: requestDictionary)
                        requests.append(request)
                    }
                }
            }
        }) { (error) in
            print(error.localizedDescription)
        }
        
    }
    
    
}

