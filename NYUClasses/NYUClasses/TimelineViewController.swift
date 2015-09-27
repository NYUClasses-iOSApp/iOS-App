//
//  TimelineViewController.swift
//  NYUClasses
//
//  Created by mAYUR on 12/11/14.
//  Copyright (c) 2014 theswiftproject. All rights reserved.
//

import Foundation
import UIKit

class TimelineViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("TimelineCell") as TimelineCell
            
            cell.typeImageView.image = UIImage(named: "coaching_icon")
            cell.nameLabel.text = "Modern Crypto Class"
            cell.postLabel?.text = "Currently you are expected to study, among other things, Lectures 1-12 work on hw4, due tomorrow, prepare for the final exam time permitting, do some extra credit work"
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCellWithIdentifier("TimelineCell") as TimelineCell
            
            cell.typeImageView.image = UIImage(named: "training-icon")
            cell.nameLabel.text = "ASD TRAINING WORKSHOP"
            cell.postLabel?.text = "Location: KIMMEL CTR - KC EISNER&LUBIN, Training Information: STEINHARDT SCHOOL OF CULTURE, EDU & HUMAN DEV"
            return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCellWithIdentifier("TimelineCell") as TimelineCell
            
            cell.typeImageView.image = UIImage(named: "discussion")
            cell.nameLabel.text = "FACULTY SENATE COUNCIL MEETING"
            cell.postLabel?.text = "Location: xGLOBAL CTR - GC GRAND HALL, CUSTOMER NAME: FACULTY SENATORS COUNCIL"
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("TimelineCell") as TimelineCell
        
            cell.typeImageView.image = UIImage(named: "event")
            cell.nameLabel.text = "John Hoylett"
            cell.postLabel?.text = "Checking out of the hotel today. It was really fun to see everyone and catch up. We should have more conferences like this so we can share ideas."
            return cell
        }
    }
    
    @IBAction func presentNavigation(sender: AnyObject?){
        performSegueWithIdentifier("presentNav", sender: self)
    }
    
}






