//
//  AuctionCell.swift
//  HackLinkedIn
//
//  Created by Kashish Goel on 2017-07-15.
//  Copyright © 2017 Kashish Goel. All rights reserved.
//

import UIKit

class AuctionCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var companyLogo: UIImageView!
    @IBOutlet weak var company: UILabel!
    @IBOutlet weak var place: UILabel!
    @IBOutlet weak var timeLeft: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    func configure(row:Int) {
        
    }
}
