//
//  ViewController.swift
//  HackLinkedIn
//
//  Created by Kashish Goel on 2017-07-14.
//  Copyright © 2017 Kashish Goel. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var discoverButton: UIButton!
    @IBOutlet weak var discoverButtonSeperator: UIView!
    
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var locationSeperator: UIView!
    
    @IBOutlet weak var companiesButton: UIButton!
    @IBOutlet weak var companiesSeperator: UIView!
    
    @IBOutlet weak var headerView: UIView!
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
        return 1
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
    
}


extension HomeVC {
    fileprivate func setup(){
        let nib = UINib(nibName: LocalizedText.collectionTableCell, bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: LocalizedText.collectionTableCellID)
    }
}
