//
//  MyProfileTableViewCell.swift
//  Hume Sales
//
//  Created by MileyLiu on 11/1/18.
//  Copyright © 2018 MileyLiu. All rights reserved.
//

import UIKit

class MyProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var headImageView: UIImageView!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        headImageView.layer.cornerRadius = headImageView.frame.width/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
