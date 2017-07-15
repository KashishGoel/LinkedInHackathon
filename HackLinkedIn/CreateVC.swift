//
//  CreateVC.swift
//  HackLinkedIn
//
//  Created by Kashish Goel on 2017-07-15.
//  Copyright © 2017 Kashish Goel. All rights reserved.
//

import Eureka

class MyFormViewController: FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        form +++ Section("General")
            <<< TextRow(){ row in
                row.title = "Place"
                row.placeholder = "Enter Place"
            }
            
            <<< TextRow(){ row in
                row.title = "Description"
                row.placeholder = "Enter Description"
            }
            
            <<< TextRow(){ row in
                row.title = "Award"
                row.placeholder = "Enter Contest Award"
            }
            
            
            +++ Section("Submission Requirements")
            <<< TextRow(){ row in
                row.title = "Number of Previous Submissions"
                row.placeholder = "Enter Amount"
            }
        
            <<< TextRow(){ row in
                row.title = "Number of Previous Submissions"
                row.placeholder = "Enter Amount"
            }
        
            <<< SliderRow() {
                $0.title = "Badge Level"
                $0.maximumValue = 5.0
                $0.value = 1.0 
        }
        
        form +++ SelectableSection<ListCheckRow<String>>("Device", selectionType: .singleSelection(enableDeselection: true))
        
        let continents = ["DSLR", "iPhone 7", "Android ", "Drone", "GoPro", "Polaroid"]
        for option in continents {
            form.last! <<< ListCheckRow<String>(option){ listRow in
                listRow.title = option
                listRow.selectableValue = option
                listRow.value = nil
            }
        }
        
        form +++ Section("Legal")
        <<< TextRow(){ row in
                row.title = "Use case"
                row.placeholder = "Example: Ads"
        }
        
        <<< TextRow(){ row in
                row.title = "Time"
                row.placeholder = "Ex. 1 month"
        }
        
        form +++ SelectableSection<ListCheckRow<String>>("Do you keep ownership?", selectionType: .singleSelection(enableDeselection: true))
        
        let yesno = ["Yes", "No"]
        for option in yesno {
            form.last! <<< ListCheckRow<String>(option){ listRow in
                listRow.title = option
                listRow.selectableValue = option
                listRow.value = nil
            }
        }
        
        
        
        
        
    }
}
