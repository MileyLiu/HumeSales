//
//  ProductDetailViewController.swift
//  Hume Sales
//
//  Created by MileyLiu on 15/1/18.
//  Copyright © 2018 MileyLiu. All rights reserved.
//

import UIKit


class ProductDetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var detailTableView: UITableView!
     var photoGallery = MLPhotoGallery.init(frame: CGRect.init(x: 0, y: 10, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.3))
    
    override func viewDidLoad() {
        super.viewDidLoad()
         loadImages()
        self.detailTableView.delegate = self
        self.detailTableView.dataSource = self
        
        self.detailTableView.rowHeight  = UITableViewAutomaticDimension
        self.detailTableView.estimatedRowHeight = 300
        
        self.productName.text = "10mm recessed edge ceiling board"
      
        // Do any additional setup after loading the view.
    }
    
    
    
    func loadImages(){
        
        
        let images = ["http://www.humeplaster.com.au/hume/wp-content/uploads/2016/09/10CBM2-350x342.jpg","http://www.humeplaster.com.au/hume/wp-content/uploads/2016/09/10CBM2_2-370x342.jpg"]
        
        self.photoGallery.bindWithServer(array: images, interval: 15.0, defaultImage: "hume")
        
        print("image loadged")
//        self.photoGallery.setUrlLinks(links: urls)
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
//        if section == 3 {
//
//            return 3
//        }
//        else {
        
            return 1
//        }
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
         return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "sliderCell") as! UITableViewCell
            
            
            cell.addSubview(photoGallery)
            
           return cell
        }
        else if indexPath.section == 1{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "descriptionCell") as! DescriptionTableViewCell
//
            cell.desContentLabel.text = "Ceiling Board is 10mm thick plasterboard used as a ceiling lining where framing members are spaced at up to 600mm centres."
//
//            cell.desContentLabel.text = "Ceiling Board is 10mm thick plasterboard ."
//
            return cell
            
        }
//        else if indexPath.section == 2
        else
        {
            
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "specificationCell") as! SpecificationTableViewCell
        
            
            cell.speContentLabel.text = "Physical Properties:\n Thickness: 10mm\n  Standard Size: 1200mm*3000mm; 1200mm*3600mm;\n1200mm*4200mm; 1200mm*4800mm;\n 1200mm*6000mm;\n 1350mm*3000mm; 1350mm*3600mm;\n 1350mm*4200mm;\n 1350mm*4800mm; 1350mm*6000mm\n  Features & Benefits:\n – Anti-sag performance\n– 15% lighter than 13mm plasterboard\nApplications:\n   Ceiling & Wall applications With its anti-sag performance, Unispan provides an alternative to 13mm plasterboard lining for ceiling applications and comes in lengths of up to 6 metres to minimise ceiling joints. "
            
            
        
            
            return cell
            
        }
//        else {
//
//
//            let cell: UITableViewCell
//
//            cell = tableView.dequeueReusableCell(withIdentifier: "fileCell", for: indexPath)
//
////            cell.textLabel?.text = "file\(indexPath.row)"
//
//
//            return cell
//        }
       
    
    
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            
            return UIScreen.main.bounds.height*0.3 + 20
        }
//        else if indexPath.section == 3{
//
//            return 50
//        }
        else{
            return UITableViewAutomaticDimension
            
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            
            return UIScreen.main.bounds.height*0.3 + 20
        }
//        else if indexPath.section == 3{
//
//            return 50
//        }
        else{
        
            return UITableViewAutomaticDimension
            
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
