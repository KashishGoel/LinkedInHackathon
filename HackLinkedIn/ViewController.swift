//
//  ViewController.swift
//  HackLinkedIn
//
//  Created by Kashish Goel on 2017-07-14.
//  Copyright © 2017 Kashish Goel. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var discoverButton: UIButton!
    @IBOutlet weak var discoverButtonSeperator: UIView!
    
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var locationSeperator: UIView!
    
    @IBOutlet weak var companiesButton: UIButton!
    @IBOutlet weak var companiesSeperator: UIView!
    
    @IBOutlet weak var headerView: UIView!
    
    
    @IBOutlet weak var label: UILabel!
    var lastOffset = CGPoint(x: 0, y: 0)
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}

extension HomeVC {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        if let cell = tableView.dequeueReusableCell(withIdentifier: LocalizedText.collectionTableCellID) as? AuctionTableViewCell {
                cell.configure(row: indexPath.row)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: LocalizedText.contestDetailsVCID)
        self.present(vc!, animated: true, completion: nil)
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
        cell.configure(row: collectionView.tag , cell: indexPath.row)
            
            return cell
        } else {
            print("returning collection view cell blank")
            return UICollectionViewCell()
        }
    }
    
}




extension HomeVC {
    fileprivate func setup(){
//        let nib = UINib(nibName: LocalizedText.collectionTableCell, bundle: nil)
//        self.tableView.register(nib, forCellReuseIdentifier: LocalizedText.collectionTableCellID)
    }
}
