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
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var wearingSwitch: UISwitch!
    
    override func viewDidLoad() {
        // TODO: Only do first time
        let recurringNotification = UILocalNotification()
        recurringNotification.fireDate = NSDate(timeIntervalSinceNow: 2)
        recurringNotification.repeatInterval = NSCalendarUnit.CalendarUnitDay
        recurringNotification.alertBody = "Are you wearing contacts today?"
        recurringNotification.category = "com.JadenGeller.notifcationCategory.queryLensUsage"
        UIApplication.sharedApplication().scheduleLocalNotification(recurringNotification)
    }

//    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
//        numberOfDaysLeft--;
//    }

    @IBAction func wearingTodayChanged(sender: UISwitch) {
        switchLabel.font = UIFont(name: "HelveticaNeue" + (sender.on ? "-Medium":"-Light"), size: 17);
        wearingToday = sender.on
    }
    
    var wearingToday: Bool = false {
        didSet {
            if wearingToday != oldValue {
                if wearingToday {
                    numberOfDaysLeft--;
                }
                else {
                    numberOfDaysLeft++;
                }
            }
        }
    }
    
    var darkMode: Bool = false {
        didSet {
            
            // Only change the colors if the value changed
            if darkMode != oldValue {
                
                let foregroundColor = darkMode ? UIColor.whiteColor() : blueColor
                
                // Set label colors
                for label in [numberLabel, descriptionLabel, switchLabel] {
                    label.textColor = foregroundColor
                }
                
                // Set button colors
                infoButton.tintColor = foregroundColor
                
                // Set switch colors
                wearingSwitch.onTintColor = foregroundColor
                
                // Set view background color
                view.backgroundColor = darkMode ? UIColor.blackColor() : UIColor.whiteColor()
            }
        }
    }
    
    var numberOfDaysLeft: Int = defaultContactLifetime {
        didSet {
            darkMode = numberOfDaysLeft <= 0
            numberLabel.text = "\(numberOfDaysLeft)"
            
            // Update description label
            switch numberOfDaysLeft {
            case let x where x > 1:
                descriptionLabel.text = "more days"
            case 1:
                descriptionLabel.text = "more day"
            default:
                descriptionLabel.text = "replace now"
            }
        }
    }

}
