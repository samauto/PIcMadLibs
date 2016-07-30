//
//  VerbPhoto+CoreDataProperties.swift
//  PicMadLibs
//
//  Created by Mac on 7/28/16.
//  Copyright © 2016 STDESIGN. All rights reserved.
//


import Foundation
import CoreData

extension VerbPhoto {
    
    // MARK: PROPERTIES
    @NSManaged var wordName:String?
    @NSManaged var wordPath: String?
    @NSManaged var imageData: NSData?
    @NSManaged var id: NSNumber?
    
    @NSManaged var madlib: MadLib?
    
}