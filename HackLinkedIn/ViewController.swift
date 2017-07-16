//
//  ViewController.swift
//  HackLinkedIn
//
//  Created by Kashish Goel on 2017-07-14.
//  Copyright © 2017 Kashish Goel. All rights reserved.
//

import UIKit
import SVProgressHUD
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
    
    var user:UserType?
    var lastOffset = CGPoint(x: 0, y: 0)
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.backgroundView = refreshControl
        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func refresh(_ refreshControl: UIRefreshControl) {
        // Do your job, when done:
        FirebaseManager.getNewEntryTrue()
        print(UserDefaults.standard.bool(forKey: "newEntry"))
        tableView.reloadData()
        FirebaseManager.getShowAlert()
        
        if (UserDefaults.standard.bool(forKey: "showAlert")) {
            let vc = UIAlertController(title: "Congrats", message: "Apple selected your image! Your money is on the way", preferredStyle: .alert)
            let action = UIAlertAction(title: "Okay", style: .destructive, handler: nil)
            
            vc.addAction(action)
            
            self.present(vc, animated: true, completion: nil)
        }
        refreshControl.endRefreshing()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if user == .business {
            DispatchQueue.main.async {
                self.companiesButton.titleLabel?.text = "Create"
            }
            
        }
        FirebaseManager.getNewEntryTrue()
        SVProgressHUD.show()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            FirebaseManager.getNewEntryTrue()
            FirebaseManager.getShowAlert()
            print(UserDefaults.standard.bool(forKey: "newEntry"))
            SVProgressHUD.dismiss()
        })
        
        if (UserDefaults.standard.bool(forKey: "showAlert")) {
            let vc = UIAlertController(title: "Congrats", message: "Apple selected your image! Your money is on the way", preferredStyle: .alert)
            let action = UIAlertAction(title: "Okay", style: .destructive, handler: nil)
            
            vc.addAction(action)
            
            self.present(vc, animated: true, completion: nil)
        }
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func companiesButtonPressed(_ sender: UIButton) {
        guard self.user == .business else {
            return
        }
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ContainerVCID")
        self.present(vc!, animated: false, completion: nil)
    }

    @IBAction func discoverButtonTapped(_ sender: UIButton) {
        FirebaseManager.getNewEntryTrue()
        print(UserDefaults.standard.bool(forKey: "newEntry"))
        tableView.reloadData()
        FirebaseManager.getShowAlert()
        
        if (UserDefaults.standard.bool(forKey: "showAlert")) {
            let vc = UIAlertController(title: "Congrats", message: "Apple selected your image! Your money is on the way", preferredStyle: .alert)
            let action = UIAlertAction(title: "Okay", style: .destructive, handler: nil)
            
            vc.addAction(action)
            
            self.present(vc, animated: true, completion: nil)
        }
    }

}

extension HomeVC {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        if let cell = tableView.dequeueReusableCell(withIdentifier: LocalizedText.collectionTableCellID) as? AuctionTableViewCell {
                cell.configure(row: indexPath.row, user: user!)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if user == .business {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SubmissionsVCID")
            self.present(vc!, animated: true, completion: nil)
            
        } else {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: LocalizedText.contestDetailsVCID)
            self.present(vc!, animated: true, completion: nil)
        }
        
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
        
        if(UserDefaults.standard.bool(forKey: "newEntry") == true ){
            if section == 0 {
                return 4
            }
        }
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
    
}
