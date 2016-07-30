//
//  ResultsTableView.swift
//  PicMadLibs
//
//  Created by Mac on 7/28/16.
//  Copyright © 2016 STDESIGN. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension PML_ResultsController
{
    // MARK: TableView Datasource
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        // Return the number of sections
        return 1
        
    }
    //END OF FUNC tableView numberOfSectionsInTableView
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows
        
        return madLists.count
        
    }
    //END OF FUNC tableView numberOfRowsInSection
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "MadLibsResultsCell"
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MadLibsResultsCell
        
        let madList = madLists[indexPath.row]
        
        cell.adjectiveDisplay.text = madList.adjectives
        cell.nounDisplay.text = madList.nouns
        cell.verbDisplay.text = madList.verbs
        cell.adverbDisplay.text = madList.adverbs
        cell.adjectiveLoading.startAnimating()
        cell.nounLoading.startAnimating()
        cell.verbLoading.startAnimating()
        cell.adverbLoading.startAnimating()
        
        if (newOrupdate == "Update"){
            cell.adjectivePhotoDisplay.image = UIImage(data: madList.adjectivephoto.imageData!)
            cell.adjectiveLoading.stopAnimating()
            cell.adjectiveLoading.hidden = true
            
            cell.nounPhotoDisplay.image = UIImage(data: madList.nounphoto.imageData!)
            cell.nounLoading.stopAnimating()
            cell.nounLoading.hidden = true
            
            cell.verbPhotoDisplay.image = UIImage(data: madList.verbphoto.imageData!)
            cell.verbLoading.stopAnimating()
            cell.verbLoading.hidden = true
            
            cell.adverbPhotoDisplay.image = UIImage(data: madList.adverbphoto.imageData!)
            cell.adverbLoading.stopAnimating()
            cell.adverbLoading.hidden = true
            
            newOrupdate = "New"
            
        } else {

            
            // LOAD NOUN PHOTO
            loadResultsImage("NounPhoto", picMadLib: madList) {(success, wordData) in
                if (success == true) {
                    performOnMain {
                        cell.nounLoading.stopAnimating()
                        cell.nounLoading.hidden = true
                        cell.nounPhotoDisplay.image = UIImage(data:wordData!)
                    }
                } else {
                    performOnMain {
                        cell.nounLoading.startAnimating()
                        cell.nounPhotoDisplay.image = UIImage(named: "Placeholder")
                        self.tableView.reloadData()
                    }

                    
                }
            }
            
            // LOAD VERB PHOTO
            loadResultsImage("VerbPhoto", picMadLib: madList) {(success, wordData) in
                if (success == true) {
                    performOnMain {
                        cell.verbLoading.stopAnimating()
                        cell.verbLoading.hidden = true
                        cell.verbPhotoDisplay.image = UIImage(data:wordData!)
                    }
                } else {
                    performOnMain {
                        cell.verbLoading.startAnimating()
                        cell.verbPhotoDisplay.image = UIImage(named: "Placeholder")
                    }
                }
            }

            // LOAD ADVERB PHOTOS
            loadResultsImage("AdverbPhoto", picMadLib: madList) {(success, wordData) in

                if (success == true) {
                    performOnMain {
                        cell.adverbLoading.stopAnimating()
                        cell.adverbLoading.hidden = true
                        cell.adverbPhotoDisplay.image = UIImage(data:wordData!)
                    }
                } else {
                    performOnMain {
                        cell.adverbLoading.startAnimating()
                        cell.adverbPhotoDisplay.image = UIImage(named: "Placeholder")
                    }
                }
            }

            // LOAD ADJECTIVE PHOTOS
            loadResultsImage("AdjectivePhoto", picMadLib: madList) {(success, wordData) in

                if (success == true) {
                    performOnMain {
                        cell.adjectiveLoading.stopAnimating()
                        cell.adjectiveLoading.hidden = true
                        cell.adjectivePhotoDisplay.image = UIImage(data:wordData!)
                    }
                } else {
                    performOnMain {
                        cell.adjectiveLoading.startAnimating()
                        cell.adjectivePhotoDisplay.image = UIImage(named: "Placeholder")
                    }
                }
            }

          }

        return cell
    } //END OF FUNC  tableView cellForRowAtIndexPath
        
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        
        // Return false if you do not want the specified item to be editable.
        return true
        
    }
    //END OF FUNC tableView canEditRowAtIndexPath
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        switch (editingStyle) {
            
        case .Delete:
            // Remove the PicMadlIb from the context
            madLists[indexPath.row].deleteAllPhotos()
            sharedContext.deleteObject(madLists[indexPath.row])
            madLists.removeAtIndex(indexPath.row)
            CoreDataStackManager.sharedInstance().saveContext()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
        default:
            break
        }
        
    }
    //END OF FUNC tableView commitEditingStyle
    
}
//END OF EXTENSION: PML_ResultsControler
