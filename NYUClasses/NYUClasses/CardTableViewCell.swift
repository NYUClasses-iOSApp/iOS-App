//
//  CardTableViewCell.swift
//  NYUClasses
//
//  Created by mAYUR on 12/2/14.
//  Copyright (c) 2014 theswiftproject. All rights reserved.
//

import UIKit
import QuartzCore

class CardTableViewCell: UITableViewCell {
    
    @IBOutlet var mainView: UIView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var aboutLabel: UILabel!
    @IBOutlet var profilePictureView: UIImageView!
    @IBOutlet var webLabel: UILabel!
    @IBOutlet var webButton: UIButton!
    
    func useMember(member:Member) {
        // Round those corners
        mainView.layer.cornerRadius = 10;
        mainView.layer.masksToBounds = true;
        
        // Fill in the data
        nameLabel.text = member.course_name
        titleLabel.text = member.prof_name
        locationLabel.text = member.prof_email
        aboutLabel.text = member.about
        profilePictureView.image = UIImage(named: member.imageName!)
        webLabel.text = member.time
        

    }
    
    func jumpTo(URLString:String?) {
        if let URL = NSURL(string: URLString!) as NSURL? {
            UIApplication.sharedApplication().openURL(URL)
        }
    }
    
    @IBAction func webButtonTapped(sender: AnyObject) {
        jumpTo(webLabel.text)
    }
    
}
