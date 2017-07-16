//
//  ContainerVC.swift
//  HackLinkedIn
//
//  Created by Kashish Goel on 2017-07-15.
//  Copyright © 2017 Kashish Goel. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD
class ContainerVC:UIViewController {


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCreateVC" {
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func discoverBtnPress(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createBtnPress(_ sender: UIButton) {
        FirebaseManager.setNewEntryTrue()
        self.dismiss(animated: false, completion: nil)
    }
    
}

