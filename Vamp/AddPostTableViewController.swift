//
//  AddPostTableViewController.swift
//  Vamp
//
//  Created by Антон Рыскалев on 29.10.15.
//  Copyright © 2015 Антон Рыскалев. All rights reserved.
//

import UIKit
import Parse
import Appodeal

class AddPostTableViewController: UITableViewController {
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var genderUserCell: UITableViewCell!
    @IBOutlet weak var countryUserCell: UITableViewCell!
    @IBOutlet weak var cityUserCell: UITableViewCell!
    
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    enum defaultsKeys {
        static let gender = "Мужской"
        static let country = "Россия"
        static let city = "Санкт-Петербург"
    }
    
    override func viewDidLoad() {
        
       // Appodeal.showAd(AppodealShowStyle.Video, rootViewController: self)
        
        let keys = NSUserDefaults.standardUserDefaults()
        
        genderLabel.text = keys.stringForKey(defaultsKeys.gender)
        countryLabel.text = keys.stringForKey(defaultsKeys.country)
        cityLabel.text = keys.stringForKey(defaultsKeys.city)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        let keys = NSUserDefaults.standardUserDefaults()
        
        genderLabel.text = keys.stringForKey(defaultsKeys.gender)
        countryLabel.text = keys.stringForKey(defaultsKeys.country)
        cityLabel.text = keys.stringForKey(defaultsKeys.city)
    }
    
    
    @IBAction func postButtonPressed(sender: AnyObject) {
        
        
        if (userTextField.text != "") {
            let request1 = VKApi.users().get(["fields":"photo_max"])
            
            var photoURL:String = "..."
            
            let keys = NSUserDefaults.standardUserDefaults()
            
            let postMainTable  = PFObject(className: "MainTable")
            postMainTable["genderUser"] = keys.stringForKey(defaultsKeys.gender)
            postMainTable["country"] = keys.stringForKey(defaultsKeys.country)
            postMainTable["city"] = keys.stringForKey(defaultsKeys.city)
            postMainTable["text"] = userTextField.text
            request1.executeWithResultBlock(
                {
                    (response) -> Void in
                    print(response.json)
                    let books = response.json as! NSArray
                    
                    var nameUser:String = books[0].objectForKey("first_name") as! String
                    nameUser += " "
                    nameUser += books[0].objectForKey("last_name") as! String
                    let idUser:String = (books[0].objectForKey("id")?.stringValue)!
                    
                    postMainTable["nameUser"] = nameUser
                    postMainTable["user_id"] = idUser
                    
                    photoURL = books[0].objectForKey("photo_max")! as! String
                    if let url = NSURL(string: photoURL) {
                        if let data = NSData(contentsOfURL: url){
                            let photo = PFFile(name: "profilePhoto.jpg", data: data)
                            postMainTable["photoUser"] = photo
                            postMainTable.saveInBackground()
                        }
                    }
                    
                }, errorBlock: {
                    (error) -> Void in
                    print("error")
                    
            })
            
            self.navigationController!.popViewControllerAnimated(true)
        } else {
            let alert = UIAlertView()
            alert.message = "Введите сообщение"
            alert.addButtonWithTitle("Ок")
            alert.show()
        }
        
        
    
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        switch indexPath.row {
        case 0:
            self.performSegueWithIdentifier("goToGenderViewController", sender: self)
        case 1:
            self.performSegueWithIdentifier("goToCountryViewController", sender: self)
        case 2:
            self.performSegueWithIdentifier("goToCityViewController", sender: self)
        default: break
        
        }
    }
}
