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
        
  
        //添加一个UITableViewController
        let tableVC = UITableViewController.init(style: .grouped)
        tableVC.tableView = self.QuoteTableView
        self.addChildViewController(tableVC)

        // Do any additional setup after loading the view.
        
        
//        //监听键盘弹出通知
//        NotificationCenter.default
//            .addObserver(self,selector: #selector(keyboardWillShow(_:)),
//                         name: NSNotification.Name.UIKeyboardWillShow, object: nil)
//        //监听键盘隐藏通知
//        NotificationCenter.default
//            .addObserver(self,selector: #selector(keyboardWillHide(_:)),
//                         name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 3
        }
        else {
            
            return 17
        }
    }
    
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "quoteCell") as! QuoteTableViewCell


            cell.itemNameLabel.text = "ItemName\(indexPath.section)-\(indexPath.row)"
            cell.itemContentTextField.attributedPlaceholder =  NSAttributedString(string: "Tap Here",
                                                                                  attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])

            cell.itemContentTextField.tag = indexPath.row
            cell.itemContentTextField.delegate = self

            cell.nextIndex =  cell.itemContentTextField.tag + 1

        return cell
    }
    
    
   
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return "Basic Info"
        }
        else {
            
            return "Order Detail"
        }
    }
    
    
    
    // 键盘显示
    @objc func keyboardWillShow(_ notification: Notification) {
        let userInfo = (notification as NSNotification).userInfo!
        //键盘尺寸
        let keyboardSize = (userInfo[UIKeyboardFrameBeginUserInfoKey]
            as! NSValue).cgRectValue
        var contentInsets:UIEdgeInsets
        //判断是横屏还是竖屏
        let statusBarOrientation = UIApplication.shared.statusBarOrientation
        if UIInterfaceOrientationIsPortrait(statusBarOrientation) {
            contentInsets = UIEdgeInsetsMake(64.0, 0.0, (keyboardSize.height), 0.0);
        } else {
            contentInsets = UIEdgeInsetsMake(64.0, 0.0, (keyboardSize.width), 0.0);
        }
        //tableview的contentview的底部大小
        self.QuoteTableView!.contentInset = contentInsets;
        self.QuoteTableView!.scrollIndicatorInsets = contentInsets;
    }
    
    // 键盘隐藏
   @objc func keyboardWillHide(_ notification: Notification) {
        //还原tableview的contentview大小
        let contentInsets:UIEdgeInsets = UIEdgeInsetsMake(64.0, 0.0, 0, 0.0);
        self.QuoteTableView!.contentInset = contentInsets
        self.QuoteTableView!.scrollIndicatorInsets = contentInsets
    }
    
   
    @IBAction func sendQuote(_ sender: Any) {
   
    
    
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
        textField.textColor = mainColor
    }
    
   
//    func textFieldDidEndEditing(_ textField: UITextField) {
//
//
//
//        let height = self.view.frame.size.height
//        let width = self.view.frame.size.width
//        let animationDuration = TimeInterval(0.30)
//        UIView.beginAnimations("ResizeForKeyBoard", context: nil)
//        UIView.setAnimationDuration(animationDuration)
//
//        let rect = CGRect.init(x: 0, y: 0, width: width, height: height)
//        self.view.frame = rect
//
//        UIView.commitAnimations()
//
//    }
//
//    func configKeyboardAction(KbHeight:Double){
//        //         txtMsg.configKeyboard()
//
//
//        //        let frame = textField.frame
//        let height = self.view.frame.size.height
//        let width = self.view.frame.size.width
//
//        print("kbHeight:\(KbHeight)")
//        let offset = KbHeight
//        print("offset:\(offset)")
//        let animationDuration = TimeInterval(0.30)
//
//        UIView.beginAnimations("ResizeForKeyBoard", context: nil)
//        UIView.setAnimationDuration(animationDuration)
//        let rect = CGRect.init(x: 0, y: CGFloat(-offset), width: width, height: height)
//        self.view.frame = rect
//
//        UIView.commitAnimations()
//
//    }
//    public func textFieldDidBeginEditing(_ textField: UITextField) {
//
//        print("textFieldDidBeginEditing")
//
//
//
//        let y = textField.frame.origin.y
//
//        print("typing frame y:\(y)")
//
//        NotificationCenter.default.addObserver(
//            self,
//
//            selector: #selector(keyboardWillShow),
//            name: NSNotification.Name.UIKeyboardWillShow,
//            object: nil
//        )
//
//
//
//
//        NotificationCenter.default.addObserver(
//            self,
//
//            selector: #selector(keyboardWillHide),
//            name: NSNotification.Name.UIKeyboardWillHide,
//            object: nil
//        )
//    }
//
//
//
//    @objc func keyboardWillShow(_ notification: Notification) {
//
//
//
//
//
//        if let keyboardFrame: NSValue = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue {
//            let keyboardRectangle = keyboardFrame.cgRectValue
//            let keyBoardHeight = Double(keyboardRectangle.height)
//            print("keyboardHeight:\(keyBoardHeight)")
//
//            configKeyboardAction(KbHeight: keyBoardHeight)
//
//
//        }
//    }
//    @objc func keyboardWillHide(_ notification: Notification) {
//
//    }
//
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
