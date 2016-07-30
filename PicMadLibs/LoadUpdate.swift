//
//  LoadImage.swift
//  PicMadLibs
//
//  Created by Mac on 7/26/16.
//  Copyright © 2016 STDESIGN. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension PML_ResultsController {
    
/*
    func loadUpdateImage(entityWord: String, picMadLib: MadLib) {
        let request = NSFetchRequest(entityName: entityWord)
        request.sortDescriptors = []
        request.predicate = NSPredicate(format: "madlib == %@", picMadLib);

        do {
            if (entityWord=="NounPhoto") {
                let results = try sharedContext.executeFetchRequest(request) as! [NounPhoto]
                if (results.count > 0) {
                    for result in results {

                        self.nounPhotoDisplay.image = UIImage(data: result.imageData!)

                    }
                } else {
                    print("No "+entityWord)
                }
            }

            else if (entityWord=="VerbPhoto") {
                
                let results = try sharedContext.executeFetchRequest(request) as! [VerbPhoto]

                    if (results.count > 0) {
                    for result in results {

                        self.verbPhotoDisplay.image = UIImage(data: result.imageData!)
                    }
                } else {
                    print("No "+entityWord)
                }
            }

            else if (entityWord=="AdverbPhoto") {
                let results = try sharedContext.executeFetchRequest(request) as! [AdverbPhoto]
                if (results.count > 0) {
                    for result in results {

                        self.adverbPhotoDisplay.image = UIImage(data: result.imageData!)

                    }
                } else {
                    print("No "+entityWord)
                }
            }

            else {
                let results = try sharedContext.executeFetchRequest(request) as! [AdjectivePhoto]

                if (results.count > 0) {
                    for result in results {

                        self.adjectivePhotoDisplay.image = UIImage(data: result.imageData!)

                    }
                } else {
                    print("No "+entityWord)
                }
            }
 
            
        } catch let error as NSError {
            // failure
            popAlert("ERROR", errorString: "Fetch failed: \(error.localizedDescription)")
        }    }
    
    
    
   */ 
    
 }