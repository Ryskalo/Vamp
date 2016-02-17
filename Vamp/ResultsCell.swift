//
//  ResultsCell.swift
//  Vamp
//
//  Created by Антон Рыскалев on 12.10.15.
//  Copyright © 2015 Антон Рыскалев. All rights reserved.
//

import UIKit

class ResultsCell: UITableViewCell {
        
        @IBOutlet weak var profileName: UILabel!
        @IBOutlet weak var profileCity: UILabel!
        @IBOutlet weak var profilePhoto: UIImageView!
        @IBOutlet weak var userMessage: UILabel!

        
        override func awakeFromNib() {
            super.awakeFromNib()
            
            let width = UIScreen.mainScreen().bounds.width
            
            contentView.frame = CGRectMake(0, 0, width, 120)
            
            profilePhoto.center = CGPointMake(60, 60)
            profilePhoto.layer.cornerRadius = profilePhoto.frame.size.width/20
            profilePhoto.clipsToBounds = true
            
            
        }
        
        override func setSelected(selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
        
        }
        
    }
