//
//  CountryTableViewController.swift
//  Vamp
//
//  Created by Антон Рыскалев on 15.10.15.
//  Copyright © 2015 Антон Рыскалев. All rights reserved.
//

import UIKit

class CountryFilterViewController: UITableViewController {
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let countryKeys = NSUserDefaults.standardUserDefaults()
        
        switch indexPath.row {
        case 0:
            countryKeys.setValue("Россия", forKey: OptionsViewController.filterKeys.countryFilter)
            self.navigationController!.popViewControllerAnimated(true)
        case 1:
            countryKeys.setValue("Украина", forKey: OptionsViewController.filterKeys.countryFilter)
            self.navigationController!.popViewControllerAnimated(true)
        case 2:
            countryKeys.setValue("Беларусь", forKey: OptionsViewController.filterKeys.countryFilter)
            self.navigationController!.popViewControllerAnimated(true)
        default: break
        }
        
        
    }
}

