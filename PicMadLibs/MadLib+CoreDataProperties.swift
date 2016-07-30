//
//  MadLib+CoreDataProperties.swift
//  PicMadLibs
//
//  Created by Mac on 7/23/16.
//  Copyright © 2016 STDESIGN. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension MadLib {
    
    // MARK: PROPERTIES
    @NSManaged var madlibID: String
    @NSManaged var nouns: String
    @NSManaged var verbs: String
    @NSManaged var adverbs: String
    @NSManaged var adjectives: String
    
    @NSManaged var nounphoto: NounPhoto
    @NSManaged var verbphoto: VerbPhoto
    @NSManaged var adverbphoto: AdverbPhoto
    @NSManaged var adjectivephoto: AdjectivePhoto
    
    @NSManaged var timeStamp: NSDate
    
}

