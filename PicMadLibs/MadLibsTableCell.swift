//
//  MadlibTableCell.swift
//  PicMadLibs
//
//  Created by Mac on 5/19/16.
//  Copyright © 2016 STDESIGN. All rights reserved.
//

import Foundation
import UIKit

class MadLibsTableCell: UITableViewCell {
    
    // MARK: Word Photo Display
    @IBOutlet weak var NounPhotoCell: UIImageView!
    @IBOutlet weak var VerbPhotoCell: UIImageView!
    @IBOutlet weak var AdverbPhotoCell: UIImageView!
    @IBOutlet weak var AdjectivePhotoCell: UIImageView!
    
    // MARK: PicMadLib Title Display
    @IBOutlet weak var PML_Title: UILabel!
 
    // MARK: Word Photo Loading Progress
    @IBOutlet weak var nounActivity: UIActivityIndicatorView!
    @IBOutlet weak var verbActivity: UIActivityIndicatorView!
    @IBOutlet weak var adverbActivity: UIActivityIndicatorView!
    @IBOutlet weak var adjectiveActivity: UIActivityIndicatorView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    
}
//END OF CLASS MadLibsTableCell
