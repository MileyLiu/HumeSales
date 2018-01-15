//
//  SpecificationTableViewCell.swift
//  Hume Sales
//
//  Created by MileyLiu on 15/1/18.
//  Copyright © 2018 MileyLiu. All rights reserved.
//

import UIKit

class SpecificationTableViewCell: UITableViewCell {

    @IBOutlet weak var speTitleLabel: UILabel!
    @IBOutlet weak var speContentLabel: UILabel!
  
    @IBOutlet weak var fileTableView: UITableView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        speTitleLabel.text = "Specification"
        
        speContentLabel.numberOfLines = 0
        speContentLabel.lineBreakMode = .byWordWrapping
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
