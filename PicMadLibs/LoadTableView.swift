//
//  LoadTableView.swift
//  PicMadLibs
//
//  Created by Mac on 7/27/16.
//  Copyright © 2016 STDESIGN. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension PML_TableViewController
{
    //MARK: PHOTOS/IMAGES
    
    func loadImage(entityWord: String, picMadLib: MadLib, completion: (success: Bool, wordData: NSData?) -> Void)
    {
        let request = NSFetchRequest(entityName: entityWord)
        request.sortDescriptors = []
        request.predicate = NSPredicate(format: "madlib == %@", picMadLib);
        
        do {
            
            if (entityWord=="NounPhoto") {
                let results = try sharedContext.executeFetchRequest(request) as! [NounPhoto]
                if (results.count > 0) {
                    for result in results {
                        wordImageData(result.wordPath!){ (sucess, wordData) in
                            completion(success: true, wordData: self.wordData)
                        }
                    }
                } else {
                    //print("TbleView No "+entityWord)
                }
            }
            else if (entityWord=="VerbPhoto") {
                let results = try sharedContext.executeFetchRequest(request) as! [VerbPhoto]
                if (results.count > 0) {
                    for result in results {
                        wordImageData(result.wordPath!){ (sucess, wordData) in
                            completion(success: true, wordData: self.wordData)
                        }
                    }
                    
                } else {
                    //print("TbleView No "+entityWord)
                }
            }
            else if (entityWord=="AdverbPhoto") {
                let results = try sharedContext.executeFetchRequest(request) as! [AdverbPhoto]
                if (results.count > 0) {
                    for result in results {
                        wordImageData(result.wordPath!){ (sucess, wordData) in
                            completion(success: true, wordData: self.wordData)
                        }
                    }
                } else {
                    //print("TbleView No "+entityWord)
                }
            }
            else {
                let results = try sharedContext.executeFetchRequest(request) as! [AdjectivePhoto]
                if (results.count > 0) {
                    for result in results {
                        wordImageData(result.wordPath!){ (sucess, wordData) in
                            completion(success: true, wordData: self.wordData)
                        }
                    }
                } else {
                    //print("TbleView No "+entityWord)
                }
            }
            
            
        } catch let error as NSError {
            
            // failure
            popAlert("ERROR", errorString: "Fetch failed: \(error.localizedDescription)")
        }
        
    }
    //END OF FUNC: loadWordImage
    
    
    func wordImageData (wordPath:String, completion: (success: Bool, wordData: NSData?) -> Void)
    {
        FlickrAPI.sharedInstance().taskForPhoto(wordPath) { (success, imageData, error) in
            if (success == false) {
                self.popAlert("ERROR", errorString: "Error can't find Photos via Flickr")
            } else {
                self.wordData = imageData
                completion(success: true, wordData: self.wordData)
            }
        }
    }
    //END OF FUNC: load_image

}
