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
    
    var placeAr = [["big cities", "Action Bike shot", "Golden Gate"],["big cities", "Action Bike shot", "Golden Gate"],["big cities", "Action Bike shot", "Golden Gate"]]
    var companyAr = [["Apple", "Google", "Chegg"],["Apple", "Google", "Chegg"],["Apple", "Google", "Chegg"]]
    var priceAr = [["$999", "$100", "$750"],["$999", "$100", "$750"],["$999", "$100", "$750"]]
    var timeLeftAr = [["5 days","8 days","10 days"],["3 days","2 days","1 days"],["13 days","11 days","04 days"]]
    var imageViewAr = [[UIImage(named:"city"),UIImage(named:"bike"),UIImage(named:"ggb")],[UIImage(named:"city"),UIImage(named:"bike"),UIImage(named:"ggb")],[UIImage(named:"city"),UIImage(named:"bike"),UIImage(named:"ggb")]]
    
    func configure(row:Int, cell:Int) {
        print("configuring")
        company.text = companyAr[row][cell]
        place.text = placeAr[row][cell]
        timeLeft.text = companyAr[row][cell]
        imageView.image = imageViewAr[row][cell]
        price.text = priceAr[row][cell]
        
    }

}
