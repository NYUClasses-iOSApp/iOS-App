//
//  ProfileViewController.swift
//  NYUClasses
//
//  Created by Gaurav Mukherjee on 12/6/14.
//  Copyright (c) 2014 theswiftproject. All rights reserved.
//


import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profile_image: UIImageView!
    @IBOutlet weak var profile_view: UIView!
    @IBOutlet weak var profile_name: UILabel!
    @IBOutlet weak var profile_id: UILabel!
    @IBOutlet weak var profile_email: UILabel!
    @IBOutlet weak var profile_nick: UITextField!
    @IBOutlet weak var profile_dob: UITextField!
    @IBOutlet weak var Address_text: UITextView!
    @IBOutlet weak var main_profile: UIView!
    @IBOutlet weak var main_profile_2: UIView!
    
    @IBOutlet weak var profile_phone: UITextField!
    let service:PostService = PostService()
    var studentInfo: NSDictionary!
    
    var _netID:NSString = ""
    
    override func viewDidLoad() {
       
        // make profile_image circular in frame
        self.profile_image.frame = CGRectMake(5, 12, 100, 100)
        self.profile_image.layer.borderWidth = 2.0
        self.profile_image.layer.masksToBounds = true
        self.profile_image.layer.borderColor = UIColor.whiteColor().CGColor
        self.profile_image.layer.cornerRadius = 50.0
        
        // profile view
        self.profile_view.layer.cornerRadius = 5.0
        self.profile_view.layer.shadowOffset = CGSizeMake(-1, 1);
        self.profile_view.layer.shadowOpacity = 0.5;
        

        // main profile
        self.main_profile.layer.cornerRadius = 5.0
        self.main_profile.layer.shadowOffset = CGSizeMake(-1, 1);
        self.main_profile.layer.shadowOpacity = 0.5;
        self.main_profile_2.layer.cornerRadius = 5.0
        self.main_profile_2.layer.shadowOffset = CGSizeMake(-1, 1);
        self.main_profile_2.layer.shadowOpacity = 0.5;
        self.Address_text.layer.cornerRadius = 5.0
        
        var response = self.service.getStudent(_netID)
        self.studentInfo = ((response as NSDictionary)["sTUDENT"] as NSDictionary)["STUDENT"]! as NSDictionary
        
        var First_Name = self.studentInfo["First_Name"] as String
        var Last_Name = self.studentInfo["Last_Name"] as String
        var profile_name = First_Name + " " + Last_Name
        
        var addr = self.studentInfo["Street_Address"] as String
        addr = addr + " " + "Jersey City" + " USA"
        
        self.profile_name.text = profile_name
        self.profile_id.text = self.studentInfo["NetID"] as? String
        self.profile_email.text = self.studentInfo["email"] as? String
        self.profile_phone.text = self.studentInfo["Phone"] as String
        self.Address_text.text = addr
        
        self.profile_image.image = UIImage(named: self.studentInfo["NetID"] as String)

        
    }
}
