//
//  MenuViewController.swift
//  NYUClasses
//
//  Created by mAYUR on 11/10/14.
//  Purpose : Create custom menubar item for application
//  Copyright (c) 2014 theswiftproject. All rights reserved.
//

import UIKit

// delegate to capture menu selected option

protocol MenuViewControllerDelegate {
    func MenuViewControllerDidselectRow(indexpath:NSIndexPath)
}

class MenuViewController: UITableViewController {

    var appConst:AppConstants = AppConstants()
    var delegate:MenuViewControllerDelegate?
    var MenuData:Array<String> = []
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuData.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("Cell") as? UITableViewCell

        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default , reuseIdentifier: "Cell")
            // Configure the cell
            
            cell!.backgroundColor = UIColor.clearColor()
            cell!.textLabel?.textColor = UIColor.darkTextColor()
            
            let selectedView:UIView = UIView(frame: CGRect(x: 0, y: 0, width: cell!.frame.size.width, height: cell!.frame.size.height))
            selectedView.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.3)
            
            cell!.selectedBackgroundView = selectedView
        }
        
        cell?.textLabel?.text = MenuData[indexPath.row]

        return cell!
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return CGFloat(appConst.menuHeight)
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        delegate?.MenuViewControllerDidselectRow(indexPath)
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var menuHeader: String = appConst.AppTitle
        return menuHeader
    }

    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(appConst.menuHeight)
    }

    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var headerView = UITableViewHeaderFooterView()
        headerView.contentView.backgroundColor = UIColor(red: 72.0/255.0, green: 22.0/255.0, blue: 137.0/255.0, alpha: 1.0)
        headerView.detailTextLabel.textColor = UIColor.whiteColor()
        headerView.textLabel.textColor = UIColor.whiteColor()
        headerView.textLabel.backgroundColor = UIColor.clearColor()
        return headerView
    }

}
