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
    
    //FUNC: popAlert(): Display an Alrt Box
    func findAPIAlert(typeOfAlert: String, errorString: String) {
        
        let findAPIController = UIAlertController(title: typeOfAlert, message: errorString, preferredStyle: UIAlertControllerStyle.Alert)
        
        findAPIController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: nil))
        
        if (self.presentedViewController == nil)
            {self.presentViewController(findAPIController, animated: true, completion: nil)}
    }
    //END OF FUNC: popAlert()
    
}
