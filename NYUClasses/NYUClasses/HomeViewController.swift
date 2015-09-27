//
//  HomeViewController.swift
//  NYUClasses
//
//  Created by mAYUR on 11/10/14.
//  Copyright (c) 2014 theswiftproject. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    var appConst:AppConstants = AppConstants()

    var _netID:NSString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (session_netID.isEmpty) {
            session_netID = _netID
            var timer = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: Selector("showWelcomeScreen"), userInfo: nil, repeats: false)
        }
        
    }

    func showWelcomeScreen() {
        SweetAlert().showAlert(self.appConst.AppWelcome, subTitle: "", style: AlertStyle.Success)
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

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if segue.identifier == "profileSegue" {
            var destination = segue.destinationViewController as ProfileViewController
            destination._netID = session_netID
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
