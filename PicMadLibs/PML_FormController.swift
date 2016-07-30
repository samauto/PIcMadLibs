//
//  ViewController.swift
//  PicMadLibs
//
//  Created by Mac on 5/18/16.
//  Copyright © 2016 STDESIGN. All rights reserved.
//
//  Parts of the code is Created by Romain Menke on 03/11/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class PML_FormController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, NSFetchedResultsControllerDelegate   {
    
    // MARK: FORM
    
    // MESSAGE
    @IBOutlet weak var formMessage: UILabel!

    // MARK: WORD PROPERTIES

    // NOUN
    @IBOutlet weak var nounInfo: UIButton!
    @IBOutlet weak var nounInput: UITextField!
    
    // VERB
    @IBOutlet weak var verbInfo: UIButton!
    @IBOutlet weak var verbInput: UITextField!
    
    // ADVERB
    @IBOutlet weak var adverbInfo: UIButton!
    @IBOutlet weak var adverbInput: UITextField!
    
    // ADJECTIVE
    @IBOutlet weak var adjectiveInfo: UIButton!
    @IBOutlet weak var adjectiveInput: UITextField!


    // MARK: WORD IMAGE PROPERTIES

    lazy var sharedContext: NSManagedObjectContext = {
        return CoreDataStackManager.sharedInstance().managedObjectContext
    }()
    
    
    // MARK: API OPTION
    var madList: MadLib?
    var wordData : NSData? = nil
    var entityWord: String = ""
    

    // MARK: BUTTONS
    @IBOutlet weak var generatePicMadLib: UIButton!
    @IBOutlet weak var generateRandom: UIBarButtonItem!


    // MARK: VIEW
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formMessage.text = "to create your PicMadLib. You have two options for Pics you can let us find a pic or click on the Camera icon to use your own pic"
        formMessage.hidden = false
        
        // Set up views if editing an existing MadLib.
        if let madList = madList {
            navigationItem.title = madList.madlibID as String
            nounInput.text = madList.nouns as String
            verbInput.text = madList.verbs as String
            adverbInput.text = madList.adverbs as String
            adjectiveInput.text = madList.adjectives as String
            generatePicMadLib.setTitle("UPDATE", forState: UIControlState.Normal)
        }
        
    }
    //END OF FUNC: viewDidLoad

    
    //MARK; BUTTONS
    
    @IBAction func cancelPressed(sender: AnyObject) {
        let isPresentingInAddMadLibMode = presentingViewController is UINavigationController

        if isPresentingInAddMadLibMode {
            dismissViewControllerAnimated(true, completion: nil)
        } else {
            navigationController!.popViewControllerAnimated(true)
        }
        
    }
    //END OF FUNC cancelPressed
    
    
    @IBAction func generatePressed(sender: AnyObject) {
        if (generatePicMadLib === sender) {
            if (generatePicMadLib.currentTitle == "UPDATE") {
                madList?.adjectives = self.adjectiveInput.text!
                madList?.adverbs = self.adjectiveInput.text!
                madList?.nouns = self.nounInput.text!
                madList?.verbs = self.verbInput.text!
                
            } else {
            let randID = Int(arc4random_uniform(1000000) + 1)
            let tempID = "PicMadLib_"+String(randID)
            
            // If fields are blank and Generate button is pressed the field will be filled with a random Word
            randWordGenButt()

            //Add the new or updated MadLib to the List
            performOnMain {
                self.madList = MadLib(madID: tempID, noun: self.nounInput.text!, verb: self.verbInput.text!, adverb: self.adverbInput.text!, adjective: self.adjectiveInput.text!, context: self.sharedContext)
            
                self.findPhotos(self.madList!, noun: self.nounInput.text!,  verb: self.verbInput.text!,  adverb: self.adverbInput.text!,  adjective: self.adjectiveInput.text!)
                CoreDataStackManager.sharedInstance().saveContext()
                }
            }
        }
    }
    //END OF FUNC: generatePressed
    
}//END OF CLASS: PML_FormController

