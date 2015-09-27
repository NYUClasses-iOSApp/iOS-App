//
//  HelpViewController.swift
//  NYUClasses
//
//  Created by mAYUR on 12/2/14.
//  Copyright (c) 2014 theswiftproject. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController,SideBarDelegate {
    
    var menuBar:MenuBar = MenuBar()
    var appConst:AppConstants = AppConstants()

    override func viewDidLoad() {
        super.viewDidLoad()
        menuBar = MenuBar(sourceView: self.view, menuItems: appConst.Menu)
        menuBar.delegate = self
    }

    @IBAction func menuBtnClicked(sender: AnyObject) {
        menuBar.showSideBar(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func sideBarDidSelectButtonAtIndex(index: Int) {
                
        // Help menu
        if  index == appConst.Menu.count-2{
            // redirect to help page
            let helpView = self.storyboard?.instantiateViewControllerWithIdentifier("helpView") as UIViewController
            self.navigationController?.pushViewController(helpView, animated: false)
        }
        
        // My announcements
        if  index == appConst.Menu.count-3 {
            // redirect to help page
            let announcementView = self.storyboard?.instantiateViewControllerWithIdentifier("announcementView") as AnnouncementViewController
            self.navigationController?.pushViewController(announcementView, animated: false)
        }
        
        // My classes menu
        if  index == appConst.Menu.count-4 {
            // redirect to help page
            let mainView = self.storyboard?.instantiateViewControllerWithIdentifier("classmenu") as MainViewController
            self.navigationController?.pushViewController(mainView, animated: false)
        }
        
        // My Home
        if  index == appConst.Menu.count-6 {
            // redirect to help page
            let HomeView = self.storyboard?.instantiateViewControllerWithIdentifier("HomeView") as HomeViewController
            self.navigationController?.pushViewController(HomeView, animated: false)
        }
    }

}
