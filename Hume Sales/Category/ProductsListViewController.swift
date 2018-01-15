//
//  ProductsListViewController.swift
//  Hume Sales
//
//  Created by MileyLiu on 12/1/18.
//  Copyright © 2018 MileyLiu. All rights reserved.
//

import UIKit
import SDWebImage
import ActionSheetPicker_3_0


class ProductsListViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{

    @IBOutlet weak var productsCollectionView: UICollectionView!
    @IBOutlet weak var SubCategoryBtn: UIButton!
    @IBOutlet weak var OrderBtn: UIButton!
    
    var subCategory = "All"
    var sort = "price low to High"
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
  self.SubCategoryBtn.set(anImage: UIImage(named:"icons8-sort_down_filled"), title: "All", titlePosition: .left, additionalSpacing: 5, state: .normal)
        
         self.OrderBtn.set(anImage: UIImage(named:"icons8-sort_down_filled"), title: "Price Low to High", titlePosition: .left, additionalSpacing: 5, state: .normal)
    
        
       
        self.productsCollectionView.delegate = self
        self.productsCollectionView.dataSource = self
        
        
        

        // Do any additional setup after loading the view.
    }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath as IndexPath) as! ProductCollectionViewCell

        SDWebImageManager.shared().loadImage(with: URL(string:"http://www.humeplaster.com.au/hume/wp-content/uploads/2016/09/CORN4ST48-270x250.jpg") as URL!, options: SDWebImageOptions.continueInBackground, progress: { (receivedSize :Int, ExpectedSize :Int, url : URL) in
            
            } as? SDWebImageDownloaderProgressBlock, completed: { (image : UIImage?, any : Data?,error : Error?, cacheType : SDImageCacheType, finished : Bool, url : URL?) in
                
                if (error != nil)  {
                    
                    print("error:\(error),\(url),\(finished)")
                    
                }
                else {
                    
                    cell.productImage?.image = image
                    
                }
        })
        
        
    
        cell.productTitleLabel.text = "100mm 4 Step Cornice 4800mm 210/pallet"
        cell.layer.cornerRadius = 8
        
        return cell
        
    }

    @IBAction func SelectSubCategory(_ sender: Any) {
        
        let plasterBoard = ["Speciality Plasterboard","General plasterboard","Plaster compounds","Plater cornice &cover"]
        
        ActionSheetStringPicker.show(withTitle: "Sub Category", rows: plasterBoard, initialSelection: 1, doneBlock: {
            
            picker, value, index in
            
          self.SubCategoryBtn.set(anImage: UIImage(named:"icons8-sort_down_filled"), title: index as! String, titlePosition: .left, additionalSpacing: 5, state: .normal)
            
//            self.pickedBranch = index as! String
//            self.branchTextField.text =  self.pickedBranch
            print("pickedBranch:\(index!)")
            return
            
            
        }, cancel: { ActionStringCancelBlock in return }, origin: sender)
        
        
        
        
    }
    
    @IBAction func SelectSort(_ sender: Any) {
        let orderBy = ["Popular","Price low to high","Price high to low","Best-Seller"]
        
        
        
        ActionSheetStringPicker.show(withTitle: "Order By", rows: orderBy, initialSelection: 1, doneBlock: {
            
            picker, value, index in
            
            self.OrderBtn.set(anImage: UIImage(named:"icons8-sort_down_filled"), title: index as! String, titlePosition: .left, additionalSpacing: 5, state: .normal)
            
            //            self.pickedBranch = index as! String
            //            self.branchTextField.text =  self.pickedBranch
            print("pickedBranch:\(index!)")
            return
            
            
        }, cancel: { ActionStringCancelBlock in return }, origin: sender)
        
        
        
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
