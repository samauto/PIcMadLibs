//
//  MadLib.swift
//  PicMadLibs
//
//  Created by Mac on 5/18/16.
//  Copyright © 2016 STDESIGN. All rights reserved.
//

import Foundation
import UIKit

//1. Import Core Data
import CoreData


//2. Make Madlib a subclass of NSManagedObject
class MadLib: NSManagedObject {
        

    
    let imageCache = ImageCache()
    
    // MARK: Core Data
    // MARK: Init
    
    
    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        //Standard Core Data init method
        super.init(entity: entity, insertIntoManagedObjectContext: context)
        
    }//END OF INIT
    
    
    init(madID: String, noun: String, verb: String, adverb: String, adjective: String, context: NSManagedObjectContext) {
        
        // Core Data
        
        let entity =  NSEntityDescription.entityForName("MadLib", inManagedObjectContext: context)!
        super.init(entity: entity,insertIntoManagedObjectContext: context)
        
        // Initialize stored properties
        madlibID = madID
        nouns = noun
        verbs = verb
        adverbs = adverb
        adjectives = adjective
        
        timeStamp = NSDate()
        
    }//END OF INIT

  /*
    //MARK: Photos
    func deleteNounPhotos() {
        for photo in nounphoto {
            deleteNoun(photo)
        }
    }//END OF FUNC: deleteNounPhotos
    
    func deleteVerbPhotos() {
        for photo in verbphoto {
            deleteVerb(photo)
        }
    }//END OF FUNC: deleteVerbPhotos

    func deleteAdverbPhotos() {
        for photo in adverbphoto {
            deleteAdverb(photo)
        }
    }//END OF FUNC: deleteNounPhotos
    
    func deleteAdjectivePhotos() {
        for photo in adjectivephoto {
            deleteAdjective(photo)
        }
    }//END OF FUNC: deleteVerbPhotos
    */
    
    func deleteAllPhotos() {
        deleteNoun(nounphoto)
        deleteVerb(verbphoto)
        deleteAdverb(adverbphoto)
        deleteAdjective(adjectivephoto)
        
    }//END OF FUNC: deleteNounPhotos
    
    
    func deleteNoun(noun: NounPhoto) {
        /* Delete the photo (including image data from the cache and hard drive) */
        //imageCache.deleteImage(noun.wordName!)
        sharedContext.deleteObject(noun)
        
        CoreDataStackManager.sharedInstance().saveContext()
    }
    
    func deleteVerb(verb: VerbPhoto) {
        /* Delete the photo (including image data from the cache and hard drive) */
        //imageCache.deleteImage(verb.wordName!)
        sharedContext.deleteObject(verb)
        
        CoreDataStackManager.sharedInstance().saveContext()
    }
    
    func deleteAdverb(adverb: AdverbPhoto) {
        /* Delete the photo (including image data from the cache and hard drive) */
        //imageCache.deleteImage(adverb.wordName!)
        sharedContext.deleteObject(adverb)
        
        CoreDataStackManager.sharedInstance().saveContext()
    }
    
    func deleteAdjective(adjective: AdjectivePhoto) {
        /* Delete the photo (including image data from the cache and hard drive) */
        //imageCache.deleteImage(adjective.wordName!)
        sharedContext.deleteObject(adjective)
        
        CoreDataStackManager.sharedInstance().saveContext()
    }
    
    
    // MARK: - Core Data Convenience
    
    var sharedContext: NSManagedObjectContext {
        return CoreDataStackManager.sharedInstance().managedObjectContext
    }

    
} //END OF CLASS: Pin
