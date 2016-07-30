//
//  Navigation.swift
//  PicMadLibs
//
//  Created by Mac on 7/28/16.
//  Copyright © 2016 STDESIGN. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension PML_FormController {
    
//MARK: NAVIGATION

// This method lets you configure a view controller before it's presented.
override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "ResultsPML" {
        performOnMain {
                let PML_Results_NavigationController = segue.destinationViewController as! UINavigationController
                let madlibDetail = PML_Results_NavigationController.topViewController as! PML_ResultsController
        
                // Get the cell that generated this segue.
                madlibDetail.selMadList = self.madList
                madlibDetail.newOrupdate = "New"
        }
    }
}
//END OF FUNC: prepareForSeque

}
//END OF EXTENSION: PML_FormController