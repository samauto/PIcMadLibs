//
//  ShareResults.swift
//  PicMadLibs
//
//  Created by Mac on 7/28/16.
//  Copyright © 2016 STDESIGN. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension PML_ResultsController {

    // Function to GENERATE the PicMadLib Image
    func generatePML() -> UIImage {
    
        UIGraphicsBeginImageContext(view.frame.size)
        view.drawViewHierarchyInRect(view.frame, afterScreenUpdates: true)
        let PMLImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    
        return PMLImage
    }
    // END OF FUNC: generatePML


    // Function to Share the PicMadLib
    @IBAction func picmadlibShare(sender: AnyObject) {
    
        let PMLImage = generatePML()
        let activityController = UIActivityViewController(activityItems: [PMLImage], applicationActivities: nil)
    
        activityController.completionWithItemsHandler = {
        activity, completed, returned, error in
        }
        if (self.presentedViewController == nil)
        {presentViewController(activityController, animated: true, completion: nil)}
    }
    // END OF FUNC: picmadlibShare

}
// END OF EXTENSION: PML_ResultsController
