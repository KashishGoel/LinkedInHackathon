//
//  Initial.swift
//  HackLinkedIn
//
//  Created by Kashish Goel on 2017-07-15.
//  Copyright © 2017 Kashish Goel. All rights reserved.
//

import Foundation
import UIKit

class InitialVC: UIViewController {
    
    
    
    
    @IBAction func userBtn(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: LocalizedText.homeVCID) as? HomeVC
        vc?.user = UserType.consumer
        self.present(vc!, animated: true, completion: nil)
    }

    @IBAction func bizBtn(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: LocalizedText.homeVCID) as? HomeVC
        vc?.user = UserType.business
        self.present(vc!, animated: true, completion: nil)
    }
}
