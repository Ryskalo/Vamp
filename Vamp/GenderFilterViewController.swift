//
//  genderPostViewController.swift
//  Vamp
//
//  Created by Антон Рыскалев on 30.10.15.
//  Copyright © 2015 Антон Рыскалев. All rights reserved.
//

import UIKit
import Parse

class GenderFilterViewController: UITableViewController {
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let genderKeysFilter = NSUserDefaults.standardUserDefaults()
        
        switch indexPath.row {
        case 0:
            genderKeysFilter.setValue("Не выбран", forKey: OptionsViewController.filterKeys.genderFilter)
            self.navigationController!.popViewControllerAnimated(true)
        case 1:
            genderKeysFilter.setValue("Мужской", forKey: OptionsViewController.filterKeys.genderFilter)
            self.navigationController!.popViewControllerAnimated(true)
        case 2:
            genderKeysFilter.setValue("Женский", forKey: OptionsViewController.filterKeys.genderFilter)
            self.navigationController!.popViewControllerAnimated(true)
        default: break
        }
        
    }
}
