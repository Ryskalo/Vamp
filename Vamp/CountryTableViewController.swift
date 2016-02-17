//
//  CountryTableViewController.swift
//  Vamp
//
//  Created by Антон Рыскалев on 15.10.15.
//  Copyright © 2015 Антон Рыскалев. All rights reserved.
//

import UIKit

class CountryTableViewController: UITableViewController {

    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let countryKeys = NSUserDefaults.standardUserDefaults()
        
        switch indexPath.row {
        case 0:
            countryKeys.setValue("Россия", forKey: AddPostTableViewController.defaultsKeys.country)
            self.navigationController!.popViewControllerAnimated(true)
        case 1:
            countryKeys.setValue("Украина", forKey: AddPostTableViewController.defaultsKeys.country)
            self.navigationController!.popViewControllerAnimated(true)
        case 2:
            countryKeys.setValue("Беларусь", forKey: AddPostTableViewController.defaultsKeys.country)
            self.navigationController!.popViewControllerAnimated(true)
        default: break
        }
        
        
    }
}

