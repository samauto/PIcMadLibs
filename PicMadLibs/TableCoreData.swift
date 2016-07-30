//
//  TableCoreData.swift
//  PicMadLibs
//
//  Created by Mac on 7/27/16.
//  Copyright © 2016 STDESIGN. All rights reserved.
//

import Foundation
import UIKit
import CoreData

//MARK: CORE DATA: Fetch PicMadLibs
extension PML_TableViewController {
    
    
    // MARK: - Load Photos
    
    
    
func loadMadLibs() -> [MadLib]? {
    
    // Create the Fetch Request
    let fetchRequest = NSFetchRequest(entityName: "MadLib")
    let sectionSortDescriptor = NSSortDescriptor(key: "timeStamp", ascending: true)
    fetchRequest.sortDescriptors = [sectionSortDescriptor]
    
    // Execute the Fetch Request
    var savedMadLibs = [MadLib]()
    do {
        savedMadLibs = try sharedContext.executeFetchRequest(fetchRequest) as! [MadLib]
        if (savedMadLibs.count > 0) {
            for smadlibs in savedMadLibs {
                if (smadlibs.nounphoto.wordName == nil) {
                    sharedContext.deleteObject(smadlibs)
                    CoreDataStackManager.sharedInstance().saveContext()
                }
        }
        }
    } catch {
        popAlert("ERROR",errorString: "Problem with retrieving PicMadLibs from Core Data!")
    }
    return savedMadLibs
    
}
//END OF FUNC: loadMadLibs()

}
