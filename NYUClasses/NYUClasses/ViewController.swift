//
//  ViewController.swift
//  NYUClasses
//
//  Created by mAYUR on 11/4/14.
//  Copyright (c) 2014 theswiftproject. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var NetIDField: UITextField!
    @IBOutlet weak var PwdField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var loginContainer: UIImageView!

    var db = DbController()
    var appConst:AppConstants = AppConstants()
    
    var netID:String = ""
    
    @IBOutlet weak var coverView: UIView!
    @IBOutlet weak var bottomView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"drawAShape:", name: "actionOnePressed", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"showAMessage:", name: "actionTwoPressed", object: nil)
        
        var dateComp:NSDateComponents = NSDateComponents()
        dateComp.year = 2014;
        dateComp.month = 11;
        dateComp.day = 28;
        dateComp.hour = 21;
        dateComp.minute = 07;
        dateComp.timeZone = NSTimeZone.systemTimeZone()
        
        var calender:NSCalendar = NSCalendar(calendarIdentifier: NSGregorianCalendar)!
        var date:NSDate = calender.dateFromComponents(dateComp)!
        
        
        var notification:UILocalNotification = UILocalNotification()
        notification.category = "FIRST_CATEGORY"
        notification.alertBody = "Hi, I am a notification"
        notification.fireDate = date
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
        // custom initialization
        self.loginBtn.layer.cornerRadius = 5.0
        self.loginView.layer.cornerRadius = 5.0
        self.loginView.layer.shadowOffset = CGSizeMake(-1, 1);
        self.loginView.layer.shadowOpacity = 0.5;
        self.NetIDField.becomeFirstResponder()
    }
    
    func showAMessage(notification:NSNotification){
        var message:UIAlertController = UIAlertController(title: "A Notification Message", message: "Hello there", preferredStyle: UIAlertControllerStyle.Alert)
        message.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(message, animated: true, completion: nil)
        
    }

    @IBAction func Authentication(sender: UIButton) {
        self.netID = self.NetIDField.text.lowercaseString
        let NetPwd = self.PwdField.text
        

        if (!self.netID.isEmpty || !NetPwd.isEmpty) {
            if db.LoginValidation(self.netID) {
                //SweetAlert().showAlert(appConst.AppWelcome, subTitle: db.getStudentName(), style: AlertStyle.Success)

//                let homeView = self.storyboard?.instantiateViewControllerWithIdentifier("homeView") as HomeViewController
//                self.navigationController?.pushViewController(homeView, animated: true)
//                self.navigationController?.navigationBarHidden = true
                
                
            } else {
                SweetAlert().showAlert(appConst.AppErr, subTitle: appConst.InvalidAuth, style: AlertStyle.Error)
            }
        } else {
            SweetAlert().showAlert(appConst.AppWarn, subTitle: appConst.BlankFields, style: AlertStyle.Warning)
        }

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        
            var destination = segue.destinationViewController as HomeViewController
            destination._netID = self.netID

    }

    override func viewDidAppear(animated: Bool) {

        UIView.animateWithDuration(1.2, delay: 2.0, options: .CurveEaseOut, animations: {
            var basketTopFrame = self.coverView.frame
            basketTopFrame.origin.y -= basketTopFrame.size.height

            var basketBottomFrame = self.bottomView.frame
            basketBottomFrame.origin.y += basketBottomFrame.size.height
            
            self.coverView.frame = basketTopFrame
            self.bottomView.frame = basketBottomFrame
            }, completion: { finished in
                println("cover View opened!")
        })

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

