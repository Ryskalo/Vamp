//
//  OptionsViewController.swift
//  Vamp
//
//  Created by Антон Рыскалев on 13.10.15.
//  Copyright © 2015 Антон Рыскалев. All rights reserved.
//

import UIKit

class OptionsViewController: UITableViewController {

    @IBOutlet weak var userGenderLabel: UILabel!
    @IBOutlet weak var userCountryLabel: UILabel!
    @IBOutlet weak var userCityLabel: UILabel!
    @IBOutlet weak var filterSwitch: UISwitch!
    
    enum filterKeys {
        static let filterActivated = "NO"
        static let genderFilter = "Мужской"
        static let countryFilter = "Россия"
        static let cityFilter = "Санкт-Петербург"
    }

    
    override func viewDidLoad() {
        
        let keys = NSUserDefaults.standardUserDefaults()
        
        userGenderLabel.text = keys.stringForKey(filterKeys.genderFilter)
        userCountryLabel.text = keys.stringForKey(filterKeys.countryFilter)
        userCityLabel.text = keys.stringForKey(filterKeys.cityFilter)
        
        
        if (keys.stringForKey(filterKeys.filterActivated) == "YES"){
            filterSwitch.setOn(true, animated: false)
        } else {
            filterSwitch.setOn(false, animated: false)
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        let keys = NSUserDefaults.standardUserDefaults()
        
        userGenderLabel.text = keys.stringForKey(filterKeys.genderFilter)
        userCountryLabel.text = keys.stringForKey(filterKeys.countryFilter)
        userCityLabel.text = keys.stringForKey(filterKeys.cityFilter)
        
        let filter = NSUserDefaults.standardUserDefaults()
        
        filter.setValue(userGenderLabel.text, forKey:filterKeys.genderFilter)
        filter.setValue(userCountryLabel.text, forKey:filterKeys.countryFilter)
        filter.setValue(userCityLabel.text, forKey:filterKeys.cityFilter)
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        switch indexPath.row {
        case 0:
            self.performSegueWithIdentifier("goToFilterGenderViewController", sender: self)
        case 1:
            self.performSegueWithIdentifier("goToFilterCountryViewController", sender: self)
        case 2:
            self.performSegueWithIdentifier("goToFilterCityViewController", sender: self)
         default: break
        
        
    }
    }
    @IBAction func filterSwitchAction(sender: AnyObject) {
        let filter = NSUserDefaults.standardUserDefaults()
        
        if (filterSwitch.on) {
            filter.setValue("YES", forKey: filterKeys.filterActivated)
        } else {
            filter.setValue("NO", forKey: filterKeys.filterActivated)
        }
        
    }
    @IBAction func logoutButtonPressed(sender: AnyObject) {
        
        VKSdk.forceLogout()
        
    }
}
