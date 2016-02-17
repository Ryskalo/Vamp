//
//  MainTableViewController.swift
//  Vamp
//
//  Created by Антон Рыскалев on 12.10.15.
//  Copyright © 2015 Антон Рыскалев. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

    @IBOutlet var resultsTable: UITableView!
  //  @IBOutlet weak var profileName: UILabel!
    
    var items: [String] = ["Elena Prokofyeva", "David Res", "Swift Swiftovich"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerClass(ResultsCell.self, forCellReuseIdentifier: "Cell")
        
    }

    override func viewDidAppear(animated: Bool) {
        
        resultsTable.reloadData()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationItem.hidesBackButton = true
    }
    
    
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 120
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:ResultsCell = self.resultsTable.dequeueReusableCellWithIdentifier("Cell") as! ResultsCell
        
        //cell.textLabel?.text = self.items[indexPath.row]
       // profileName.text = self.items[indexPath.row]
        cell.profileName?.text = self.items[indexPath.row]
        
        return cell
    }
override     
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell #\(indexPath.row)!")
    }
}
