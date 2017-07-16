//
//  ContestDetailsVC.swift
//  HackLinkedIn
//
//  Created by Kashish Goel on 2017-07-15.
//  Copyright © 2017 Kashish Goel. All rights reserved.
//

import Foundation
import UIKit

class ContestDetailsVC:UIViewController, UICollectionViewDataSource,UICollectionViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var companyImg: UIImageView!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var bigImage: UIImageView!
    
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var place: UILabel!
    
    @IBOutlet weak var descriptionText: UILabel!
    
    @IBOutlet weak var submitted: UILabel!
    @IBOutlet weak var submitBtn: MaterialButton!
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
            cell.configure(row: collectionView.tag , cell: indexPath.row)
            
            return cell
        } else {
            print("returning collection view cell blank")
            return UICollectionViewCell()
        }
    }
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
  
        DispatchQueue.main.async {
            self.submitBtn.titleLabel?.text = "Submitted"
            self.submitBtn.isEnabled = false
        }
        self.dismiss(animated: true, completion: { () -> Void in
            
        })
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        submitted.isHidden = false
        DispatchQueue.main.async {
            self.submitBtn.titleLabel?.text = "Done"
            self.submitBtn.isEnabled = false
        }
        
        self.dismiss(animated: true) {
            self.submitted.isHidden = false
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "LegalVCID")
            self.present(vc!, animated: true, completion: nil)
        }
    }
    
    @IBAction func backButtonPress(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func submitBtnPress(_ sender: UIButton) {
        submitted.isHidden = false
        var imagePicker = UIImagePickerController()
        DispatchQueue.main.async {
            self.submitted.isHidden = false
            self.submitBtn.titleLabel?.text = "Submitted"
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum;
            imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true, completion: nil)
        }
        
    }
}
