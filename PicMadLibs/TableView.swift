//
//  TableView.swift
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
    // MARK: TableView Datasource
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections
        return 1
        
    }
    
    //END OF FUNC tableView numberOfSectionsInTableView
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (madLists.count > 0) {
            noPicMadLibsLabel.hidden = true
            navigationItem.leftBarButtonItem = editButtonItem()
        }
        else {
            navigationItem.leftBarButtonItem = nil
        }
        
        // Return the number of rows
        return madLists.count
        
    }
    //END OF FUNC tableView numberOfRowsInSection
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "MadLibsTableCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MadLibsTableCell
        
        // Fetches the appropriate madlib for the data source layout.
        let madList = madLists[indexPath.row]
        
        let date = madList.timeStamp
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MMM-dd-yyyy hh:mm:ss"
        let dateString = dateFormatter.stringFromDate(date)
        
        cell.PML_Title.text = dateString
        
        if (cell.NounPhotoCell.image == nil){
            cell.nounActivity.startAnimating()
            cell.nounActivity.hidden = false
            cell.NounPhotoCell.image = UIImage(named: "Placeholder")
        
            loadImage("NounPhoto", picMadLib: madList) {(success, wordData) in
                if (success == true) {
                    performOnMain {
                        cell.nounActivity.stopAnimating()
                        cell.nounActivity.hidden = true
                        cell.NounPhotoCell.image = UIImage(data:wordData!)
                     }
                } else {
                    performOnMain {
                        cell.nounActivity.startAnimating()
                        cell.NounPhotoCell.image = UIImage(named: "Placeholder")
                    }
                }
            }

        }
        
        if (cell.VerbPhotoCell.image == nil){
            cell.verbActivity.startAnimating()
            cell.verbActivity.hidden = false
            cell.VerbPhotoCell.image = UIImage(named: "Placeholder")

            loadImage("VerbPhoto", picMadLib: madList) {(success, wordData) in
                if (success == true) {
                    performOnMain {
                        cell.verbActivity.stopAnimating()
                        cell.verbActivity.hidden = true
                        cell.VerbPhotoCell.image = UIImage(data:wordData!)
                    }
                } else {
                    performOnMain {
                        cell.verbActivity.startAnimating()
                        cell.VerbPhotoCell.image = UIImage(named: "Placeholder")
                    }
                }
            }

        }
        
        if (cell.AdverbPhotoCell.image == nil){
            cell.adverbActivity.startAnimating()
            cell.adverbActivity.hidden = false
            cell.AdverbPhotoCell.image = UIImage(named: "Placeholder")
        
            loadImage("AdverbPhoto", picMadLib: madList){(success, wordData) in
                if (success == true) {
                    performOnMain {
                        cell.adverbActivity.stopAnimating()
                        cell.adverbActivity.hidden = true
                        cell.AdverbPhotoCell.image = UIImage(data:wordData!)
                    }
                } else {
                    performOnMain {
                        cell.adverbActivity.startAnimating()
                        cell.AdverbPhotoCell.image = UIImage(named: "Placeholder")
                    }
                }
            }
        }
        
        if (cell.AdjectivePhotoCell.image == nil){
            cell.adjectiveActivity.startAnimating()
            cell.adjectiveActivity.hidden = false
            cell.AdjectivePhotoCell.image = UIImage(named: "Placeholder")

            loadImage("AdjectivePhoto", picMadLib: madList){(success, wordData) in
                if (success == true) {
                    performOnMain {
                        cell.adjectiveActivity.stopAnimating()
                        cell.adjectiveActivity.hidden = true
                        cell.AdjectivePhotoCell.image = UIImage(data:wordData!)
 
                    }
                } else {
                    performOnMain {
                        cell.adjectiveActivity.startAnimating()
                        cell.AdjectivePhotoCell.image = UIImage(named: "Placeholder")
                    }
                }
            }
        }
        
        
        
        
        
        return cell

    }
    //END OF FUNC tableView cellForRowAtIndexPath

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