//
//  AuctionTableViewCell.swift
//  HackLinkedIn
//
//  Created by Kashish Goel on 2017-07-15.
//  Copyright © 2017 Kashish Goel. All rights reserved.
//

import UIKit

class AuctionTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var seeMoreButton: UIButton!
    @IBOutlet weak var header: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
}

extension AuctionTableViewCell {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LocalizedText.collectionCellID, for: indexPath) as? AuctionCollectionViewCell {
            cell.configure(row: indexPath.row)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
}

extension AuctionTableViewCell {
    func configure(row:Int) {
        let nib = UINib(nibName: LocalizedText.collectionCellID, bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: LocalizedText.collectionCellID)
    }
}

extension AuctionTableViewCell {
    @IBAction func seeMorePressed(_ sender: UIButton) {
        
    }
}
