//
//  AppConstants.swift
//  NYUClasses
//
//  Created by mAYUR on 11/8/14.
//  Purpose : To maintain global constants of the App
//  Copyright (c) 2014 theswiftproject. All rights reserved.
//

 var dbURL: String = "http://172.16.29.122"

 var session_netID = ""
 var login_attempt = 0
 var login_status = ""

struct AppConstants {
    //  App information
    var AppVersion: String = "v2.0"
    var AppTitle: String = "NYU Classes"
    
    // Login form messages
    var AppLogin: String = "NYU Login"
    var AppWelcome: String = "Welcome"
    var AppWarn: String = "Warning"
    var AppErr: String = "Error"
    var InvalidAuth: String = "Invalid NetID and/or Password !!!"
    var BlankFields: String = "Please fill out NetID and/or Password Field !!!"

    // Logout messages
    var AppLogoutWarn: String = "Are you sure?"
    var AppLogoutCancel: String = "No, cancel"
    var AppLogoutConfirm: String = "Yes, Logout"
    var AppLogout: String = "You've been logged out !"
    var AppLogoutCancelled: String = "Your request Cancelled !"

    // Sidebar menu options
    var menuHeight = 45.0
    var menuBarWidth = 200.0
    var Menu:Array<String> = ["Home",
                              "My Profile",
                              "My Classes",
                              "My Announcements",
                              "Course Evaluation",
                              "Need Help?",
                              "LogOut"]
    
    //  JSON url links
    var viewStudent: String = dbURL  + "/blackboard/STUDENTs/view/$.json"
    var getAnnouncementlink = dbURL  + "/blackboard/Announcements/get/all.json"
    var setAnnouncement =  dbURL + "/blackboard/Announcements/read_status/$.json"

}