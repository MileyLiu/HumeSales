//
//  TaskTableViewCell.swift
//  Hume Sales
//
//  Created by MileyLiu on 11/1/18.
//  Copyright © 2018 MileyLiu. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

   
    @IBOutlet weak var taskNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
