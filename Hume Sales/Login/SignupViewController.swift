//
//  SignupViewController.swift
//  Hume Sales
//
//  Created by MileyLiu on 11/1/18.
//  Copyright © 2018 MileyLiu. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var bgView: UIImageView!
    @IBOutlet weak var cancelBtn: UIButton!
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var repeatPswText: UITextField!
    
    @IBOutlet weak var signupBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.bgView.image = UIImage(named:"bg")
        self.signupBtn.layer.cornerRadius = 10
        
        self.emailText.leftViewMode = .always
        self.emailText.leftView = UIImageView.init(image: UIImage(named:"icons8-gmail"))
        
        self.passwordText.leftViewMode = .always
        self.passwordText.leftView =  UIImageView.init(image: UIImage(named:"icons8-password"))
        
        self.repeatPswText.leftViewMode = .always
        self.repeatPswText.leftView =  UIImageView.init(image: UIImage(named:"icons8-password"))
        
        
        
        self.emailText.attributedPlaceholder = NSAttributedString(string: "Email address",
                                                                       attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        
        
        
        self.passwordText.attributedPlaceholder = NSAttributedString(string: "Password",
                                                                          attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        self.repeatPswText.attributedPlaceholder = NSAttributedString(string: "Repeat Password",
                                                                     attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        
        
        
        
        self.passwordText.configKeyboard()
        
        self.emailText.configKeyboard()
        self.repeatPswText.configKeyboard()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func closePage(_ sender: Any) {
        self.dismiss(animated: true) {
            
        }
    }
    @IBAction func signUpClicked(_ sender: Any) {
        
        
        
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
