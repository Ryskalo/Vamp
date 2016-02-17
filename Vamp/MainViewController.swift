//
//  MainViewController.swift
//  Vamp
//
//  Created by Антон Рыскалев on 13.10.15.
//  Copyright © 2015 Антон Рыскалев. All rights reserved.
//

import UIKit
import Parse
import Bolts

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var filterView1:LGFilterView!
    var filterView2:LGFilterView!
    var titleButton:UIButton!
    
     var refreshControl:UIRefreshControl!
    
    var titlesFilter = ["Йо","dfghj","QWE"]
    
    
    var loadMoreStatus = false
    var customURL = "vk://vk.com/id"
    
    
    var resultsNameUser = [String]()
    var resultsGenderUser = [String]()
    var resultsDate = [NSDate]()
    var resultsTextUser = [String]()
    var resultsUserId = [String]()
    var resultsPhotoFile = [PFFile]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        getPosts()

        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 150
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
        tableView.addSubview(refreshControl)
        
        titleButton = UIButton.init()
        titleButton.setTitle(titlesFilter.first, forState: UIControlState.Normal)
        titleButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        titleButton.addTarget(self, action: Selector("filterAction1:"), forControlEvents: UIControlEvents.TouchUpInside)
        
      //  self.navigationItem.titleView = titleButton
        
       // setupFilterViewsWithTransitionStyle()
    }
    
//    override func preferredStatusBarStyle() -> UIStatusBarStyle {
//        return .LightContent
//    }
    
    
    override func viewDidAppear(animated: Bool) {
        resultsNameUser.removeAll()
        resultsGenderUser.removeAll()
        resultsDate.removeAll()
        resultsTextUser.removeAll()
        resultsPhotoFile.removeAll()
        tableView.reloadData()
        getPosts()

    }
    
    func  filterAction1(button:UIButton){
        
        if ((filterView2?.showing) != nil){
        filterView2.dismissAnimated(true, completionHandler: nil)
        }
        if ((filterView1?.showing) != nil)
        {
            filterView1.selectedIndex = button.tag
            filterView1.showInView(self.view, animated: true, completionHandler: nil)
        }
        else {
            filterView1.dismissAnimated(true, completionHandler: nil)
        }
        
    }
    
    func  filterAction2(button:UIButton) {
        if(filterView1.showing){
            filterView1.dismissAnimated(true, completionHandler: nil)
        }
        
        if(filterView2.showing){
            filterView2.showInView(self.view, animated: true, completionHandler: nil)
        } else {
            filterView2.dismissAnimated(true, completionHandler: nil)
        }
    }
    
    func setupFilterViewsWithTransitionStyle() {

        filterView1 = LGFilterView.init(titles: titlesFilter, actionHandler: { (filterView:LGFilterView!, title:String!, index:UInt!) -> Void in
                self.titleButton.setTitle(title!, forState: UIControlState.Normal)
            }, cancelHandler: nil)
        
        filterView1.numberOfLines = 0
        
    }
    
    func getPosts() {
        
        let keys = NSUserDefaults.standardUserDefaults()
        
        if (keys.stringForKey(OptionsViewController.filterKeys.filterActivated) == "YES"){
            
            let setPredicate = NSPredicate(format: "genderUser = %@ AND city = %@ AND country = %@", keys.stringForKey(OptionsViewController.filterKeys.genderFilter)! , keys.stringForKey(OptionsViewController.filterKeys.cityFilter)! , keys.stringForKey(OptionsViewController.filterKeys.countryFilter)!)
            
            let query = PFQuery(className: "MainTable", predicate: setPredicate)
            
            query.orderByDescending("createdAt")
            
            let objects = try! query.findObjects()
            
            for object in objects {
                self.resultsNameUser.append(object["nameUser"] as! String)
                self.resultsGenderUser.append(object["genderUser"] as! String)
                self.resultsTextUser.append(object["text"] as! String)
                self.resultsPhotoFile.append(object["photoUser"] as! PFFile)
                self.resultsUserId.append(object["user_id"] as! String)
                self.resultsDate.append((object.updatedAt! as NSDate))
                
                self.tableView.reloadData()
            }
            
        } else if (keys.stringForKey(OptionsViewController.filterKeys.filterActivated) == "NO") {
            
            let query = PFQuery(className: "MainTable")
            
            query.orderByDescending("updatedAt")
            
            let objects = try! query.findObjects()
            
            for object in objects {
                self.resultsNameUser.append(object["nameUser"] as! String)
                self.resultsGenderUser.append(object["genderUser"] as! String)
                self.resultsTextUser.append(object["text"] as! String)
                self.resultsPhotoFile.append(object["photoUser"] as! PFFile)
                self.resultsUserId.append(object["user_id"] as! String)
                self.resultsDate.append((object.updatedAt! as NSDate))
                
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.resultsNameUser.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:ResultsCell = self.tableView.dequeueReusableCellWithIdentifier("Cell") as! ResultsCell
        
        cell.profileName?.text = self.resultsNameUser[indexPath.row]
        cell.profileCity?.text = self.resultsDate[indexPath.row].timeAgo
        cell.userMessage.lineBreakMode = NSLineBreakMode.ByWordWrapping
        cell.userMessage.numberOfLines = 0
        cell.userMessage?.text = self.resultsTextUser[indexPath.row]
        resultsPhotoFile[indexPath.row].getDataInBackgroundWithBlock { (imageData:NSData?, error: NSError?) -> Void in
            if error == nil {
                let image = UIImage(data: imageData!)
                cell.profilePhoto.image = image
            }
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let vkUserUrl = NSURL(string: customURL + self.resultsUserId[indexPath.row])
        
        
        if(UIApplication.sharedApplication().canOpenURL(vkUserUrl!)) {
        
            UIApplication.sharedApplication().openURL(vkUserUrl!)
        }
    }
    
    func adjustHeightOfTableview() {
        
        var height = self.tableView.contentSize.height
        let maxHeight = (self.tableView.superview?.frame.size.height)! - self.tableView.frame.origin.y
        
        if (height > maxHeight){
            height = maxHeight
        }
        
        UIView.animateWithDuration(0.25) { () -> Void in
            var frame = self.tableView.frame
            frame.size.height = height
            self.tableView.frame = frame
        }
    }
    
    func refresh(sender:AnyObject) {
        refreshBegin("Refresh",
            refreshEnd: {(x:Int) -> () in
                //self.tableView.reloadData()
                self.resultsNameUser.removeAll()
                self.resultsGenderUser.removeAll()
                self.resultsDate.removeAll()
                self.resultsTextUser.removeAll()
                self.resultsPhotoFile.removeAll()
                self.getPosts()
                self.refreshControl.endRefreshing()
        })
    }
    
    func refreshBegin(newtext:String, refreshEnd:(Int) -> ()) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
           // print("refreshing")
           //self.tableView.reloadData()
            sleep(2)
            
            dispatch_async(dispatch_get_main_queue()) {
                refreshEnd(0)
            }
        }
    }
    
    @IBAction func optionButtonPressed(sender: AnyObject) {
        
        self.performSegueWithIdentifier("goToOptionsViewController", sender: self)
        
    }
    @IBAction func addPostButtonPressed(sender: AnyObject) {
        
        self.performSegueWithIdentifier("goToAddPostTableViewController", sender: self)
        
    }
}


