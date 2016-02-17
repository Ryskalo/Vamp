//
//  CityTableViewController.swift
//  Vamp
//
//  Created by Антон Рыскалев on 15.10.15.
//  Copyright © 2015 Антон Рыскалев. All rights reserved.
//

import UIKit

class CityTableViewController: UITableViewController {

    var citiesRussia =
   [ "Москва" ,"Санкт-Петербург"
    ,"Новосибирск"
    ,"Екатеринбург"
    ,"Нижний Новгоро"
    ,"Казань"
    ,"Челябинск"
    ,"Омск"
    ,"Самара"
    ,"Ростов-на-Дону"
    ,"Уфа"
    ,"Красноярск"
    ,"Пермь"
    ,"Воронеж"
    ,"Волгоград"
    ,"Саратов"
    ,"Краснодар"
    ,"Тольятти"
    ,"Тюмень"
    ,"Ижевск"
    ,"Барнаул"
    ,"Иркутск"
    ,"Ульяновск"
    ,"Хабаровск"
    ,"Владивосток"
    ,"Ярославль"
    ,"Махачкала"
    ,"Томск"
    ,"Оренбург"
    ,"Новокузнецк"
    ,"Кемерово"
    ,"Рязань"
    ,"Астрахань"
    ,"Набережные Челны"
    ,"Пенза"
    ,"Липецк"]
    

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.citiesRussia.count;
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell!
        
        if (NSUserDefaults.standardUserDefaults().stringForKey(AddPostTableViewController.defaultsKeys.country) == "Россия"){
            cell.textLabel?.text = citiesRussia[indexPath.row]
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let key = NSUserDefaults.standardUserDefaults()
        key.setValue(citiesRussia[indexPath.row], forKey:AddPostTableViewController.defaultsKeys.city)
        self.navigationController!.popViewControllerAnimated(true)
        
    }
}
