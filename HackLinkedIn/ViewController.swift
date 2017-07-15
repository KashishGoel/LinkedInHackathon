//
//  ViewController.swift
//  HackLinkedIn
//
//  Created by Kashish Goel on 2017-07-14.
//  Copyright © 2017 Kashish Goel. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        FirebaseManager.createAccount(name: "Bob", email: "test5@gmail.com", pass: "linkedin", userType: .business)
        
        FirebaseManager.createAuctionRequest(description: "auctiontest1", image: "https://firebasestorage.googleapis.com/v0/b/linkedininternhackathon.appspot.com/o/images%2Fpost-pictures%2Fkid-bike.jpg?alt=media&token=697d71a8-de09-4a66-b34b-38dcbfe1c673", makePublic: true, trawl: true, price: 99 ,tags: ["bike", "girl"])
    
    }


}

