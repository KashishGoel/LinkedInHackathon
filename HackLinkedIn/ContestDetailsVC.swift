//
//  ContestDetailsVC.swift
//  HackLinkedIn
//
//  Created by Kashish Goel on 2017-07-15.
//  Copyright © 2017 Kashish Goel. All rights reserved.
//

import Foundation
import UIKit

class ContestDetailsVC:UIViewController, UICollectionViewDataSource,UICollectionViewDelegate {
    
    @IBOutlet weak var companyImg: UIImageView!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var bigImage: UIImageView!
    
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var place: UILabel!
    
    @IBOutlet weak var descriptionText: UILabel!
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        //2
        let paddingSpace = 10
        let availableWidth = 120
        let widthPerItem = 252
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("checking if cell is ")
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LocalizedText.collectionCellID, for: indexPath) as? AuctionCollectionViewCell {
            
            print("configuring cells")
            if (user == .business) {
                cell.configure(row: collectionView.tag , cell: indexPath.row, user:UserType.business)
            } else {
                cell.configure(row: collectionView.tag , cell: indexPath.row, user:UserType.consumer)
            }
            
            return cell
        } else {
            print("returning collection view cell blank")
            return UICollectionViewCell()
        }
    }
    @IBAction func backButtonPress(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
