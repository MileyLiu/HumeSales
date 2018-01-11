//
//  QuoteViewController.swift
//  Hume Sales
//
//  Created by MileyLiu on 11/1/18.
//  Copyright © 2018 MileyLiu. All rights reserved.
//

import UIKit

class QuoteViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate{

    @IBOutlet weak var QuoteTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.QuoteTableView.delegate = self
        self.QuoteTableView.dataSource = self

        // Do any additional setup after loading the view.
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        }
        else {
            return 9
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "quoteCell") as! QuoteTableViewCell
    
        cell.itemNameLabel.text = "ItemName\(indexPath.row)"
        cell.itemContentTextField.attributedPlaceholder =  NSAttributedString(string: "ItemContent\(indexPath.row)",
                                                                              attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        
        cell.itemContentTextField.tag = indexPath.row
        
        cell.itemContentTextField.delegate = self
//        cell.itemContentTextField.delegate = self
        cell.nextIndex =  cell.itemContentTextField.tag + 1
        
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Basic Info"
            
        default:
            return "Order Detail"
        }
    }
    
   
    @IBAction func sendQuote(_ sender: Any) {
   
    
    
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        
        
        let height = self.view.frame.size.height
        let width = self.view.frame.size.width
        let animationDuration = TimeInterval(0.30)
        UIView.beginAnimations("ResizeForKeyBoard", context: nil)
        UIView.setAnimationDuration(animationDuration)
        
        let rect = CGRect.init(x: 0, y: 0, width: width, height: height)
        self.view.frame = rect
        
        UIView.commitAnimations()
        
    }
    
    func configKeyboardAction(KbHeight:Double){
        //         txtMsg.configKeyboard()
        
        
        //        let frame = textField.frame
        let height = self.view.frame.size.height
        let width = self.view.frame.size.width
        
        print("kbHeight:\(KbHeight)")
        let offset = KbHeight
        print("offset:\(offset)")
        let animationDuration = TimeInterval(0.30)
        
        UIView.beginAnimations("ResizeForKeyBoard", context: nil)
        UIView.setAnimationDuration(animationDuration)
        let rect = CGRect.init(x: 0, y: CGFloat(-offset)+128, width: width, height: height)
        self.view.frame = rect
        
        UIView.commitAnimations()
        
    }
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        
        let y = textField.frame.origin.y
        
        print("typing frame y:\(y)")
        
        NotificationCenter.default.addObserver(
            self,
            
            selector: #selector(keyboardWillShow),
            name: NSNotification.Name.UIKeyboardWillShow,
            object: nil
        )
        
        print("textFieldDidBeginEditing")
        
        
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyBoardHeight = Double(keyboardRectangle.height)
            print("keyboardHeight:\(keyBoardHeight)")
            
            configKeyboardAction(KbHeight: keyBoardHeight)
            
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
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
