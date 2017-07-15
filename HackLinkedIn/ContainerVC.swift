//
//  ContainerVC.swift
//  HackLinkedIn
//
//  Created by Kashish Goel on 2017-07-15.
//  Copyright © 2017 Kashish Goel. All rights reserved.
//

import Foundation
import UIKit
class ContainerVC:UIViewController {

    @IBAction func createBtnPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCreateVC" {
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

