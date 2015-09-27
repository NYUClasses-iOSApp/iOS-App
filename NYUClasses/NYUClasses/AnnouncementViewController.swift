//
//  AnnouncementViewController.swift
//  NYUClasses
//
//  Created by mAYUR on 12/4/14.
//  Copyright (c) 2014 theswiftproject. All rights reserved.
//

import UIKit

class AnnouncementViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SideBarDelegate{

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var announcement_cnt: UILabel!
    var dataArray: NSArray = NSArray()
    var rowData: NSDictionary = NSDictionary()
    var refreshControl:UIRefreshControl!  // An optional variable
    var data: NSMutableData = NSMutableData()
    
    var menuBar:MenuBar = MenuBar()
    var appConst:AppConstants = AppConstants()
    
    var new_announcement: Dictionary<String, Int> = [:]

    //@IBOutlet weak var announcement_image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControlSetup()
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "customCell")
        startConnectionAt(appConst.getAnnouncementlink)
        
        menuBar = MenuBar(sourceView: self.view, menuItems: appConst.Menu)
        menuBar.delegate = self
        
        // make announcement count label round
        self.announcement_cnt.layer.masksToBounds = true
        self.announcement_cnt.layer.cornerRadius = 4.0
        self.announcement_cnt.frame = CGRectMake(109.0, 3.0, 18.0, 16.0)
    }

    func startConnectionAt(urlPath: String){
        var url: NSURL = NSURL(string: urlPath)!
        var request: NSURLRequest = NSURLRequest(URL: url)
        var connection: NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: false)!
        connection.start()
    }
    
    func connection(connection: NSURLConnection!, didFailWithError error: NSError!) {
        println("Connection failed.\(error.localizedDescription)")
    }
    
    func connection(connection: NSURLConnection, didRecieveResponse response: NSURLResponse)  {
        println("Recieved response")
    }
    
    func connection(didReceiveResponse: NSURLConnection!, didReceiveResponse response: NSURLResponse!) {
        self.data = NSMutableData()
    }
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!) {
        self.data.appendData(data)
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        var dataAsString: NSString = NSString(data: self.data, encoding: NSUTF8StringEncoding)!
        var err: NSError
        var json: NSDictionary = NSJSONSerialization.JSONObjectWithData(self.data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
        var results: NSArray = json["announcement"] as NSArray
        self.dataArray = results
        
        tableView.reloadData()
    }
    //end load JSONFrom URL
    
    func refreshControlSetup(){
        self.refreshControl = UIRefreshControl()
        self.refreshControl.attributedTitle = NSAttributedString(string: "Loading new Announcements...")
        self.refreshControl.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
        self.tableView.addSubview(refreshControl)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count;
        
    }
    
    func refresh(sender:AnyObject)
    {
        startConnectionAt(appConst.getAnnouncementlink)
        self.refreshControl.endRefreshing()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "miaCella"
        var cell: customCell! = self.tableView.dequeueReusableCellWithIdentifier(identifier ,forIndexPath: indexPath) as customCell
        
        /*
        if cell==nil {
        cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? customCell
        }*/
        
        rowData = (dataArray[indexPath.row] as NSDictionary)["Announcement"]! as NSDictionary
        
        var title=rowData["title"] as String
        var subtitle=rowData["subtitle"] as String
        var read_status=rowData["read_status"] as String
        var announcementID = rowData["id"] as String
        
        cell.mioTesto.alpha=0.0
        cell.mioSubtitle.alpha=0.0
        
                    dispatch_async(dispatch_get_main_queue(), {
                        cell.mioTesto.text = title
                        cell.mioSubtitle.text = subtitle
                        UIView.animateWithDuration(1.0,
                            delay: 0.0,
                            options: .CurveEaseInOut,
                            animations: {
                                cell.mioTesto.alpha=1.0
                                cell.mioSubtitle.alpha=1.0
                            },
                            completion: { finished in
                                
                        })
                        
        })

        if (read_status == "0") {
            //cell?.contentView.backgroundColor = UIColor(red: 136.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.6)

            self.new_announcement[announcementID] = 1
            
            cell.mioImage.image = UIImage(named: "red_announcement")
            
        }

        self.announcement_cnt.text = String(self.new_announcement.count)
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("Selected: \(indexPath.row)!")
        performSegueWithIdentifier("miaview", sender: self.view)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var index = self.tableView.indexPathForSelectedRow()
        if segue.identifier == "miaview" {
            var indexPath=index?.row
            
            rowData = (dataArray[indexPath!] as NSDictionary)["Announcement"]! as NSDictionary
        
            var destination = segue.destinationViewController as AnnouncementDetailViewController
            destination._announcementID = rowData["id"] as String
            destination._title = rowData["title"] as String
            destination._description = rowData["description"] as String
            destination._createdDate = rowData["ts"] as String
        }
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

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
