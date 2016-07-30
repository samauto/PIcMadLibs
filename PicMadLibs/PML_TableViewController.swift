//
//  PML_TableViewController.swift
//  PicMadLibs
//
//  Created by Mac on 5/19/16.
//  Copyright © 2016 STDESIGN. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class PML_TableViewController: UITableViewController,NSFetchedResultsControllerDelegate {
    
    // MARK: PROPERTIES
    
    // MadLibs Array
    var madLists = [MadLib]()
    var wordData : NSData? = nil
    var internetYESNO = "YES"
    
    // Label to notify that there is no PicMadLibs on the list
    var noPicMadLibsLabel: UILabel! = nil
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    // MARK: CORE DATA ShareContext
    lazy var sharedContext: NSManagedObjectContext = {
        return CoreDataStackManager.sharedInstance().managedObjectContext
    }()

    
    // MARK: VIEW
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
        //check for Internet Connection
        if Reachability.isConnectedToNetwork() == true {
            print("internet connection OK")
        }
        
        // Label to notify that there is no PicMadLibs on the list
        noPicMadLibsLabel = UILabel(frame: CGRectMake(0,0,tableView.bounds.size.width,tableView.bounds.size.height))
        noPicMadLibsLabel.text = "No PicMadLibs available. \nAdd one with the + button."
        noPicMadLibsLabel.textAlignment = NSTextAlignment.Center
        noPicMadLibsLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        noPicMadLibsLabel.numberOfLines = 2
        noPicMadLibsLabel.sizeToFit()
        noPicMadLibsLabel.font = UIFont(name: "HelveticaNeue", size: 25)!
        noPicMadLibsLabel.textColor = UIColor.whiteColor()
        tableView.backgroundView = self.noPicMadLibsLabel
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None

        
        // Loads the PicMadLibs
        if let savedPicMadLibs = loadMadLibs() {
            madLists += savedPicMadLibs
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        if Reachability.isConnectedToNetwork() == false {
            print("Internet connection FAILED")
            addButton.enabled = false
            popAlert("NO INTERNET CONNECTION", errorString: "You will be only able to view your existing PicMadLibs but not able to make new ones. Make sure your device is connected to the internet")
            internetYESNO = "NO"
        }
    }
    
    //END OF FUNC viewDidLoad
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }//END OF FUNC: viewWillAppear

    // MARK: Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "DetailsPML" {
            print("Seeing a Detailed view of the PicsMadLib")
            let PML_Results_NavigationController = segue.destinationViewController as! UINavigationController
            let madlibDetail = PML_Results_NavigationController.topViewController as! PML_ResultsController
            
            // Get the cell that generated this segue.
            if let detailsMadlibCell = sender as? MadLibsTableCell {
                let indexPath = tableView.indexPathForCell(detailsMadlibCell)!
                let detailsMadlib = madLists[indexPath.row]
                madlibDetail.selMadList = detailsMadlib
                madlibDetail.internetYESNO = internetYESNO
            }
            
        }
        
        else if segue.identifier == "AddPML" {
            print("Adding new PicMadLib.")
        }
 
    }
    //END OF FUNC prepareForSegue
    
    
    @IBAction func unwindToMadLibList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? PML_ResultsController, madList = sourceViewController.selMadList {
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update an existing PicMadLib
                madLists[selectedIndexPath.row] = madList
                tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
            } else {
                // Add a new PicMadLib
                let newIndexPath = NSIndexPath(forRow: madLists.count, inSection: 0)
                madLists.append(madList)
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
            }
            
            CoreDataStackManager.sharedInstance().saveContext()
        }

    }
    //END OF FUNC unwind
    

    
    //MARK: ALERTS
    
    //FUNC: popAlert(): Display an Alrt Box
    func popAlert(typeOfAlert: String, errorString: String) {
        let alertController = UIAlertController(title: typeOfAlert, message: errorString, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: nil))
        if (self.presentedViewController == nil)
        {self.presentViewController(alertController, animated: true, completion: nil)}
    }
    //END OF FUNC: popAlert()

    
    
}
//END OF CLASS: PML_TableViewController