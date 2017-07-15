//
//  TextField+HL.swift
//  HackLinkedIn
//
//  Created by Kashish Goel on 2017-07-15.
//  Copyright © 2017 Kashish Goel. All rights reserved.
//

import UIKit

class MaterialTextField: UITextField {
    let shadowColor:CGFloat = 157.0/255.0
    
    override func awakeFromNib() {
        layer.cornerRadius = 2.0
        layer.borderColor = UIColor(red: shadowColor, green: shadowColor, blue: shadowColor, alpha: 0.1).cgColor
        layer.borderWidth = 1.0
    }
    
    //pushes the placeholder text to the right
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 0)
    }
    
    //ensures text is still moved to the right when editing
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 0)
    }
    
}
