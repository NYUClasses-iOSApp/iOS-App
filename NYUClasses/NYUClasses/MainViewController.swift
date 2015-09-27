//
//  MainViewController.swift
//  NYUClasses
//
//  Created by mAYUR on 12/2/14.
//  Copyright (c) 2014 theswiftproject. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController, SideBarDelegate {

    var menuBar:MenuBar = MenuBar()
    var appConst:AppConstants = AppConstants()
    var members:[Member] = []
    var didAnimateCell:[NSIndexPath: Bool] = [:]
    
    // #pragma mark - Model
    
    func loadModel() {
        let path = NSBundle.mainBundle().pathForResource("TeamMembers", ofType: "json")
        members = Member.loadMembersFromFile(path!)
    }
    
    // #pragma mark - View Lifetime
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuBar = MenuBar(sourceView: self.view, menuItems: appConst.Menu)
        menuBar.delegate = self
        
        // appearance and layout customization
        self.tableView.backgroundView = UIImageView(image:UIImage(named:"background"))
        
        // load our model
        loadModel();
    }
    
    // #pragma mark - Table View
        
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if didAnimateCell[indexPath] == nil || didAnimateCell[indexPath]! == false {
            didAnimateCell[indexPath] = true
            TipInCellAnimator.animate(cell)
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return members.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Card", forIndexPath: indexPath) as CardTableViewCell
        let member = members[indexPath.row]
        cell.useMember(member)
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    func sideBarDidSelectButtonAtIndex(index: Int) {
        
        // check if selected button is logout button
        if index == appConst.Menu.count-1 {
            logoutBtnClicked(self)
        }
        
        // Help menu
        if  index == appConst.Menu.count-2{
            // redirect to help page
            self.performSegueWithIdentifier("helpSegue", sender: nil)
        }
        
        // Course Evaluation
        if  index == appConst.Menu.count-3 {
            // redirect to announcements page
            self.performSegueWithIdentifier("evaluationSegue", sender: nil)
        }

        // My announcements
        if  index == appConst.Menu.count-4 {
            // redirect to announcements page
            self.performSegueWithIdentifier("announcementSegue", sender: nil)
        }
        
        // My classes menu
        if  index == appConst.Menu.count-5 {
            // redirect to my class page
            self.performSegueWithIdentifier("classSegue", sender: nil)
        }
        
        // My profile
        if  index == appConst.Menu.count-6 {
            // redirect to profile page
            self.performSegueWithIdentifier("profileSeguev", sender: nil)
        }

    }
    
    @IBAction func menuBtnClicked(sender: AnyObject) {
        menuBar.showSideBar(true)
    }

    @IBAction func logoutBtnClicked(sender: AnyObject) {
        //Chaining alerts with messages on button click
        SweetAlert().showAlert(appConst.AppLogoutWarn, subTitle: "", style: AlertStyle.Warning, buttonTitle:appConst.AppLogoutCancel, buttonColor:UIColorFromRGB(0xD0D0D0) , otherButtonTitle:  appConst.AppLogoutConfirm, otherButtonColor: UIColorFromRGB(0xDD6B55)) {
            
            (isOtherButton) -> Void in
            if isOtherButton == true {
                
                SweetAlert().showAlert(self.appConst.AppTitle, subTitle: self.appConst.AppLogoutCancelled, style: AlertStyle.Error)
            }
            else {
                SweetAlert().showAlert(self.appConst.AppTitle, subTitle: self.appConst.AppLogout, style: AlertStyle.Success)
                
                // redirect to main login page
                let LoginView = self.storyboard?.instantiateViewControllerWithIdentifier("LoginView") as ViewController
                self.navigationController?.pushViewController(LoginView, animated: false)
            }
    }

  }

}
