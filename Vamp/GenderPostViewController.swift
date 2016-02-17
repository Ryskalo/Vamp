//
//  genderPostViewController.swift
//  Vamp
//
//  Created by Антон Рыскалев on 30.10.15.
//  Copyright © 2015 Антон Рыскалев. All rights reserved.
//

import UIKit
import Parse

class GenderPostViewController: UITableViewController {
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let genderKeys = NSUserDefaults.standardUserDefaults()
        
        switch indexPath.row {
        case 0:
            genderKeys.setValue("Не выбран", forKey: AddPostTableViewController.defaultsKeys.gender)
            self.navigationController!.popViewControllerAnimated(true)
        case 1:
            genderKeys.setValue("Мужской", forKey: AddPostTableViewController.defaultsKeys.gender)
            self.navigationController!.popViewControllerAnimated(true)
        case 2:
            genderKeys.setValue("Женский", forKey: AddPostTableViewController.defaultsKeys.gender)
            self.navigationController!.popViewControllerAnimated(true)
        default: break
    }
        
    }
}
