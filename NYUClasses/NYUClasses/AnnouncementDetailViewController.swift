//
//  AnnouncementDetailViewController.swift
//  NYUClasses
//
//  Created by mAYUR on 12/5/14.
//  Copyright (c) 2014 theswiftproject. All rights reserved.
//

import UIKit

class AnnouncementDetailViewController: UIViewController {

    var appConst:AppConstants = AppConstants()
    
    @IBOutlet weak var _label: UILabel!
    @IBOutlet weak var _textView: UITextView!
    @IBOutlet weak var course_name: UITextView!
    @IBOutlet weak var created_date: UILabel!
    @IBOutlet weak var prof_name: UITextView!
    
    var _title:NSString = ""
    var _description:NSString = ""
    var _createdDate:NSString = ""
    var _announcementID:NSString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _label.text = _title
        _textView.text = _description
        prof_name.text = "Suzanne K McIntosh" as String
        course_name.text = "Programming for Big Data Analytics" as String
        created_date.text = _createdDate
        
        // update announcement read_status to true
        var read_announcementLink = appConst.setAnnouncement
            read_announcementLink = read_announcementLink.stringByReplacingOccurrencesOfString("$", withString: _announcementID)
        
        var url: NSURL = NSURL(string: read_announcementLink)!
        var request: NSURLRequest = NSURLRequest(URL: url)
        var connection: NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: false)!
        connection.start()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backbtnPressed(sender: AnyObject) {
        
        // redirect to announcementView page
        let announcementView = self.storyboard?.instantiateViewControllerWithIdentifier("announcementView") as AnnouncementViewController
        self.navigationController?.pushViewController(announcementView, animated: false)
    }
}
