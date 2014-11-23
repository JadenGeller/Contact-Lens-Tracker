//
//  BacksideViewController.swift
//  Contact Lens Tracker
//
//  Created by Jaden Geller on 11/22/14.
//  Copyright (c) 2014 Jaden Geller. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {
    @IBOutlet weak var remainingStepper: UIStepper!
    
    var remainingDays: Int = 365 {
        didSet {
            let day = remainingDays == 1 ? "Day" : "Days"
            remainingLabel.text = "\(remainingDays) \(day) Remaining"
        }
    }
    
    var lifetimeDays: Int = 400 {
        didSet {
            newLifetimeLabel.text = "\(lifetimeDays) Day Lifetime"
            
            if (lifetimeDays < remainingDays) {
                remainingDays = lifetimeDays
            }
            
            remainingStepper.maximumValue = Double(lifetimeDays)
        }
    }
    
    @IBOutlet weak var remainingLabel: UILabel!
    @IBAction func remainingChanged(sender: UIStepper) {
        remainingDays = Int(sender.value)
    }
   
    @IBOutlet weak var newLifetimeLabel: UILabel!
    @IBAction func newLifetimeChanged(sender: UIStepper) {
        lifetimeDays = Int(sender.value)
    }
    @IBAction func donePress(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
