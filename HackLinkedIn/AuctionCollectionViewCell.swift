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
    

    var placeAr = [["Big Cities", "Action Bike shot", "Golden Gate"],["Learning in Class", "Clam Chowder", "Business Casual"],["Doctors and Medicine", "Long Distance Running", "Pair Programming"]]
    var companyAr = [["Apple", "Google", "Salesforce"],["Citi Bank", "Campbells", "GE"],["Stanford", "Google", "Udacity"]]
    var priceAr = [["$450", "$100", "$750"],["$500", "$100", "$300"],["$250", "$100", "$50"]]
    var timeLeftAr = [["22 hours","8 days","10 days"],["3 days","2 days","1 days"],["13 days","11 days","4 days"]]
    var imageViewAr = [[UIImage(named:"city"),UIImage(named:"bike"),UIImage(named:"ggb")],[UIImage(named:"class"),UIImage(named:"clam"),UIImage(named:"casual")],[UIImage(named:"doc"),UIImage(named:"lr"),UIImage(named:"pair")]]
    var companyLogoAr = [[UIImage(named:"appl"),UIImage(named:"go"),UIImage(named:"sf")],[UIImage(named:"citi"),UIImage(named:"camp"),UIImage(named:"ge")],[UIImage(named:"stnf"),UIImage(named:"go"),UIImage(named:"uda")]]
    
    func configure(row:Int, cell:Int, user:UserType) {
        print("configuring")
        company.text = companyAr[row][cell]
        place.text = placeAr[row][cell]
        timeLeft.text = timeLeftAr[row][cell]
        imageView.image = imageViewAr[row][cell]
        companyLogo.image = companyLogoAr[row][cell]
        price.text = priceAr[row][cell]
        
    }

}
