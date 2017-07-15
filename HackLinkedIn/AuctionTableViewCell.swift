//
//  AuctionTableViewCell.swift
//  HackLinkedIn
//
//  Created by Kashish Goel on 2017-07-15.
//  Copyright © 2017 Kashish Goel. All rights reserved.
//

import UIKit

class AuctionTableViewCell: UITableViewCell {

    @IBOutlet weak var seeMoreButton: UIButton!
    @IBOutlet weak var header: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var placeAr = ["big cities", "Action Bike shot", "Golden Gate"]
    var companyAr = ["Apple", "Google", "Chegg"]
    var priceAr = ["$999", "$100", "$750"]
    var timeLeftAr = ["5 days","8 days","10 days"]
    var featureAr = ["Featured", "Recommended", "New"]
    var imageViewAr = [UIImage(named:"city"),UIImage(named:"bike"),UIImage(named:"ggb")]

    
    var row = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        

        // Configure the view for the selected state
    }

    
    
}

//extension AuctionTableViewCell {
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        
//    }
//    
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//        //2
//        let paddingSpace = 10
//        let availableWidth = 120
//        let widthPerItem = 252
//        
//        return CGSize(width: widthPerItem, height: widthPerItem)
//    }
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 3
//    }
//    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//    
//     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        print("checking if cell is ")
//        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LocalizedText.collectionCellID, for: indexPath) as? AuctionCollectionViewCell {
//
//            print("configuring cells")
//            cell.configure(row: row, cell: indexPath.row)
//            
//            return cell
//        } else {
//            print("returning collection view cell blank")
//            return UICollectionViewCell()
//        }
//    }
//}

extension AuctionTableViewCell {
    func configure(row:Int, user:UserType) {
//        let nib = UINib(nibName: LocalizedText.collectionCell, bundle: nil)
//        //collectionView.register(nib, forCellWithReuseIdentifier: LocalizedText.collectionCellID)
//       self.collectionView.register(AuctionCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: LocalizedText.collectionCellID)
        self.row = row
        self.collectionView.tag = row
        self.header.text = featureAr[row]
        self.collectionView.reloadData()
    }
}

extension AuctionTableViewCell {
    @IBAction func seeMorePressed(_ sender: UIButton) {
        
    }
}
