//
//  FileTableViewCell.swift
//  Hume Sales
//
//  Created by MileyLiu on 15/1/18.
//  Copyright © 2018 MileyLiu. All rights reserved.
//

import UIKit

class FileTableViewCell: UITableViewCell {

    @IBOutlet weak var fileNameLabel: UILabel!
    var fileUrl :String?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
