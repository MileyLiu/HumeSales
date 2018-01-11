//
//  MeViewController.swift
//  Hume Sales
//
//  Created by MileyLiu on 11/1/18.
//  Copyright © 2018 MileyLiu. All rights reserved.
//

import UIKit

class MeViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var meTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.meTableView.delegate = self
        self.meTableView.dataSource = self

        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 3
        default:
            return 1
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        if indexPath.section == 0 {
            
           
            
          let cell =  tableView.dequeueReusableCell(withIdentifier: "profileCell") as! MyProfileTableViewCell
            
            cell.emailLabel.text = sampleEmail
            let arr = sampleEmail.split(separator: ".")
            
            
            cell.NameLabel.text = "Hello,\(arr[0].uppercased())"
           
            return cell
            
        }
        else{
            
              let cell =  tableView.dequeueReusableCell(withIdentifier: "detailsCell") as! ImageTableViewCell
            
            
            if indexPath.section == 1{
                cell.iconImageView.image = UIImage(named:"icons8-show_property")
                cell.itemLabel.text = "My Quotes"
            }
            
            else {
                
                
                switch indexPath.row {
              
                case 0:
                   cell.itemLabel.text = "Notification"
                   cell.iconImageView.image = UIImage(named:"icons8-megaphone")
                case 1:
                    cell.itemLabel.text = "Summary"
                    cell.iconImageView.image = UIImage(named:"icons8-combo_chart")
                default:
                    cell.itemLabel.text = "Setting"
                    cell.iconImageView.image = UIImage(named:"icons8-settings")
                   
               }
                
                
            }
    
            
            
           return cell
            
            
            
        }
        
      
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 100
        default:
            return 44
        }
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
