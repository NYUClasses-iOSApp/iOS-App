//
//  customCell.swift
//  NYUClasses
//
//  Created by mAYUR on 12/4/14.
//  Copyright (c) 2014 theswiftproject. All rights reserved.
//

import Foundation
import UIKit

class customCell: UITableViewCell{
    @IBOutlet var mioTesto : UILabel!
    @IBOutlet var mioSubtitle : UILabel!
    @IBOutlet weak var _activity: UIActivityIndicatorView!
    
    @IBOutlet var mioImage: UIImageView!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}