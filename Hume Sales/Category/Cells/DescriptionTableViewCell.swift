//
//  DescriptionTableViewCell.swift
//  Hume Sales
//
//  Created by MileyLiu on 15/1/18.
//  Copyright © 2018 MileyLiu. All rights reserved.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {
  
    @IBOutlet weak var desTitleLabel: UILabel!
    
    @IBOutlet weak var desContentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.desTitleLabel.text = "Description"
        
        self.desContentLabel.numberOfLines = 0
        self.desContentLabel.lineBreakMode = .byWordWrapping
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
