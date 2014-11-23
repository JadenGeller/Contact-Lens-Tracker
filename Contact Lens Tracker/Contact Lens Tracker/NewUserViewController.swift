//
//  NewUserViewController.swift
//  Contact Lens Tracker
//
//  Created by Jaden Geller on 11/22/14.
//  Copyright (c) 2014 Jaden Geller. All rights reserved.
//

import UIKit

class NewUserViewController: UIViewController {
   
    @IBOutlet weak var lifetimeField: UITextField!
    
    override func viewDidLoad() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardDidAppear:", name: UIKeyboardDidShowNotification, object: nil)
        lifetimeField.becomeFirstResponder()
    }
    
    func keyboardDidAppear(notification: NSNotification) {
        let frame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue()
        
        UIView.animateWithDuration(0.5) {
            self.bottomConstraint.constant = frame.size.height
        }
    }
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
}
