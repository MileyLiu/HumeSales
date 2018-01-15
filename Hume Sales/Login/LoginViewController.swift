//
//  LoginViewController.swift
//  Hume Sales
//
//  Created by MileyLiu on 10/1/18.
//  Copyright © 2018 MileyLiu. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.bgImageView.image = UIImage(named:"bg")
        self.loginButton.layer.cornerRadius = 10
        
      
        
//        self.emailTextField.leftViewMode = .always
//        self.emailTextField.leftView = UIImageView.init(image: UIImage(named:"icons8-gmail"))
//        //TODO REMOVE FOR REAL
//        self.emailTextField.text = sampleEmail
//        
//        self.passwordTextField.leftViewMode = .always
//        self.passwordTextField.leftView =  UIImageView.init(image: UIImage(named:"icons8-password"))
//        
//        self.emailTextField.attributedPlaceholder = NSAttributedString(string: "Email address",
//                                                                       attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
//        
//    
//        
//        
//        self.passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password",
//                                                                       attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
//        
//        
//      
//        
        self.emailTextField.configKeyboard()
        self.passwordTextField.configKeyboard()
        
        
        
        // Do any additional setup after loading the view.
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
