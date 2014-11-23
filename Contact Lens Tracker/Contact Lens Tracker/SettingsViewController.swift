//
//  BacksideViewController.swift
//  Contact Lens Tracker
//
//  Created by Jaden Geller on 11/22/14.
//  Copyright (c) 2014 Jaden Geller. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {
    @IBOutlet weak var remainingLabel: UILabel!
    @IBAction func remainingChanged(sender: UIStepper) {
        
    }
   
    @IBOutlet weak var newLifetimeLabel: UILabel!
    @IBAction func newLifetimeChanged(sender: UIStepper) {
    }
    @IBAction func donePress(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
