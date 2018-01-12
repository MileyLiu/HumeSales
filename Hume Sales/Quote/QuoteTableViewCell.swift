//
//  QuoteTableViewCell.swift
//  Hume Sales
//
//  Created by MileyLiu on 11/1/18.
//  Copyright © 2018 MileyLiu. All rights reserved.
//

import UIKit

class QuoteTableViewCell: UITableViewCell,UITextFieldDelegate{

    @IBOutlet weak var itemContentTextField: UITextField!
    @IBOutlet weak var itemNameLabel: UILabel!
    var nextIndex :Int = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        self.itemContentTextField.returnKeyType = .next
        self.itemContentTextField.delegate = self
        self.itemContentTextField.configKeyboard()
       
    }
    
    
    
   
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("next item:\(nextIndex)")
        textField.resignFirstResponder()
        return false
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
