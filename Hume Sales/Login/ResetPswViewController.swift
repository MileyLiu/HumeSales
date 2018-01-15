//
//  ResetPswViewController.swift
//  Hume Sales
//
//  Created by MileyLiu on 11/1/18.
//  Copyright © 2018 MileyLiu. All rights reserved.
//

import UIKit

class ResetPswViewController: UIViewController {

    @IBOutlet weak var bgView: UIImageView!
    @IBOutlet weak var cancelBtn: UIButton!
    
    @IBOutlet weak var resetBtn: UIButton!
    
    @IBOutlet weak var emailAddressText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.bgView.image = UIImage(named:"bg")
        self.resetBtn.layer.cornerRadius = 10
        
//        self.emailAddressText.leftViewMode = .always
//        self.emailAddressText.leftView = UIImageView.init(image: UIImage(named:"icons8-gmail"))
//        
//        self.emailAddressText.attributedPlaceholder = NSAttributedString(string: "Email address",
//                                                                       attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        
        self.emailAddressText.configKeyboard()

        // Do any additional setup after loading the view.
    }

    @IBAction func Dismiss(_ sender: Any) {
          self.dismiss(animated: true, completion: nil)
    }
    @IBAction func ResetPsw(_ sender: Any) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
