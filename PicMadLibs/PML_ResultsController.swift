//
//  PML_ResultsController.swift
//  PicMadLibs
//
//  Created by Mac on 7/28/16.
//  Copyright © 2016 STDESIGN. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class PML_ResultsController: UITableViewController,NSFetchedResultsControllerDelegate {

    //MARK: PROPERTIES
    
    // Madlibs Array
    var selMadList: MadLib!
    var madLists = [MadLib]()

    var wordData : NSData? = nil
    var newOrupdate: String = "Update"
    var internetYESNO: String = ""
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var refreshpicked: UIBarButtonItem!
    
    // MARK: CORE DATA ShareContext
    lazy var sharedContext: NSManagedObjectContext = {
        return CoreDataStackManager.sharedInstance().managedObjectContext
    }()

    
    // MARK: VIEW
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (internetYESNO == "NO") {
            editButton.enabled = false
        }
        
        if (newOrupdate == "New") {
            cancelButton.title = "HOME"
        }
        
        
        
        
            //self.tableView.delegate = self
        //self.tableView.dataSource = self
    }
    //END OF FUNC viewDidLoad
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        madLists = [selMadList]
        
        let triggerTime = (Int64(NSEC_PER_SEC) * 10)
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, triggerTime), dispatch_get_main_queue(), { () -> Void in
            self.refreshAuto()
        })
        
        self.tableView.reloadData()
    }
    //END OF FUNC: viewWillAppear
    
    
    @IBAction func refreshPressed(sender: AnyObject) {
        self.tableView.reloadData()
    }
    
    func refreshAuto(){
    self.tableView.reloadData()
}

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "UpdatePML" {
            
            let PML_Form_NavigationController = segue.destinationViewController as! UINavigationController
            let madlibUpdate = PML_Form_NavigationController.topViewController as! PML_FormController
            
            //  let madlibUpdate = segue.destinationViewController as! PML_FormController
            let selectedMadlib = selMadList
            madlibUpdate.madList = selectedMadlib
        }
        
    }
    //END OF FUNC prepareForSegue

    
    @IBAction func cancelPressed(sender: AnyObject) {
        let isPresentingInAddMadLibMode = presentingViewController is UINavigationController
        if isPresentingInAddMadLibMode {
            dismissViewControllerAnimated(true, completion: nil)
        } else {
            navigationController!.popViewControllerAnimated(true)
        }
    }
    //END OF FUNC cancelPressed
    
}
//END OF CLASS: PML_ResultsController