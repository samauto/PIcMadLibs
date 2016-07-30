//
//  wordKeyboard.swift
//  PicMadLibs
//
//  Created by Mac on 7/30/16.
//  Copyright © 2016 STDESIGN. All rights reserved.
//
import Foundation
import UIKit
import CoreData

extension PML_FormController{
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    // Function to Subscribe from Keyboard WILL SHOW
    func subscribeToKeyboardNotifications() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(PML_FormController.keyboardWillShow(_:)),name: UIKeyboardWillShowNotification, object: nil)
    }


    // Function to Subscribe from Keyboard WILL HIDE
    func subscribeToKeyboardwillhideNotifications() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(PML_FormController.keyboardWillHide(_:)),name: UIKeyboardWillHideNotification, object: nil)
    }


    // Function to UnSubscribe from Keyboard WILL SHOW
    func unsubscribeFromKeyboardNotifications() {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
    }


    // Function to UnSubscribe from Keyboard WILL HIDE
    func unsubscribeFromKeyboardwillhideNotifications() {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    }


    // Function to Keyboard WILL SHOW
    func keyboardWillShow(notification: NSNotification) {
        if adjectiveInput.isFirstResponder() {
            view.frame.origin.y = -getKeyboardHeight(notification)
        }
        if adverbInput.isFirstResponder() {
            view.frame.origin.y = -getKeyboardHeight(notification)
        }
    }


    // Function to Keyboard WILL HIDE
    func keyboardWillHide(notification: NSNotification) {
        view.frame.origin.y = 0
    }


    // Function to Get Keyboard Height
    func getKeyboardHeight(notification: NSNotification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        return keyboardSize.CGRectValue().height
}

}
// END OF EXTENSION: wordKeyboard