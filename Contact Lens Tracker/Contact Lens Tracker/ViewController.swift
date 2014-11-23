//
//  ViewController.swift
//  Contact Lens Tracker
//
//  Created by Jaden Geller on 11/22/14.
//  Copyright (c) 2014 Jaden Geller. All rights reserved.
//

import UIKit

let darkModeLabelTag = 100
let blueColor = UIColor(red: 0, green: 175.0/255.0, blue: 208.0/255.0, alpha: 1.0)
let defaultContactLifetime = 20

class ViewController: UIViewController {
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        numberOfDaysLeft--;
    }

    var darkMode: Bool = false {
        didSet {
            
            // Only change the colors if the value changed
            
            if darkMode != oldValue {
                // Set label colors
                for label in [numberLabel, descriptionLabel] {
                    label.textColor = darkMode ? UIColor.whiteColor() : blueColor
                }
                
                // Set view background color
                view.backgroundColor = darkMode ? UIColor.blackColor() : UIColor.whiteColor()

            }
        }
    }
    
    var numberOfDaysLeft: Int = defaultContactLifetime {
        didSet {
            darkMode = numberOfDaysLeft == 0
            numberLabel.text = "\(numberOfDaysLeft)"
        }
    }

}
