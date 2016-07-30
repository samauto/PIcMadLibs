//
//  MadLibsReultsCell.swift
//  PicMadLibs
//
//  Created by Mac on 7/28/16.
//  Copyright © 2016 STDESIGN. All rights reserved.
//

import Foundation
import UIKit

class MadLibsResultsCell: UITableViewCell {
    
    // MARK: Word Display
    @IBOutlet weak var adjectiveDisplay: UILabel!
    @IBOutlet weak var nounDisplay: UILabel!
    @IBOutlet weak var verbDisplay: UILabel!
    @IBOutlet weak var adverbDisplay: UILabel!
    
    // MARK: Word Photo Display
    @IBOutlet weak var adjectivePhotoDisplay: UIImageView!
    @IBOutlet weak var nounPhotoDisplay: UIImageView!
    @IBOutlet weak var verbPhotoDisplay: UIImageView!
    @IBOutlet weak var adverbPhotoDisplay: UIImageView!
    
    // MARK: Word Photo Loading Progress
    @IBOutlet weak var adjectiveLoading: UIActivityIndicatorView!
    @IBOutlet weak var nounLoading: UIActivityIndicatorView!
    @IBOutlet weak var verbLoading: UIActivityIndicatorView!
    @IBOutlet weak var adverbLoading: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    
}
//END OF CLASS MadLibsResultsCell
