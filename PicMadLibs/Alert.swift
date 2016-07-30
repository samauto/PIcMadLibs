//
//  Alert.swift
//  PicMadLibs
//
//  Created by Mac on 7/23/16.
//  Copyright © 2016 STDESIGN. All rights reserved.
//

import Foundation
import UIKit

extension PML_FormController{
    
    //FUNC: findAPIAlert(): Display an Alrt Box
    func findAPIAlert(typeOfAlert: String, errorString: String) {
        
        let findAPIController = UIAlertController(title: typeOfAlert, message: errorString, preferredStyle: UIAlertControllerStyle.Alert)
        
        findAPIController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: nil))
        
        if (self.presentedViewController == nil)
            {self.presentViewController(findAPIController, animated: true, completion: nil)}
    }
    //END OF FUNC: findAPIAlert()
 
    
    //FUNC: internetAlert(): Display an Alrt Box
    func internetAlert(typeOfAlert: String, errorString: String) {
        let internetController = UIAlertController(title: typeOfAlert, message: errorString, preferredStyle: UIAlertControllerStyle.Alert)
        internetController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: {action in self.goBack()}))
        if (self.presentedViewController == nil)
        {self.presentViewController(internetController, animated: true, completion: nil)}
    }
    //END OF FUNC: internetAlert()
}
