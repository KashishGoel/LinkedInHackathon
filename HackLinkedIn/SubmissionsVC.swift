//
//  SubmissionsVC.swift
//  HackLinkedIn
//
//  Created by Kashish Goel on 2017-07-15.
//  Copyright © 2017 Kashish Goel. All rights reserved.
//

import Foundation
import UIKit

class SubmissionsVC:UIViewController {
    
    @IBAction func prss(_ sender: UIButton) {
       FirebaseManager.setShowAlert()
        self.dismiss(animated: true, completion: nil)
    }
}
