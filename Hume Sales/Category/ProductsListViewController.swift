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
import SafariServices

class ProductsListViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UISearchBarDelegate{

    @IBOutlet weak var productsCollectionView: UICollectionView!
    @IBOutlet weak var SubCategoryBtn: UIButton!
    @IBOutlet weak var OrderBtn: UIButton!
    
    
//    var searchBar :UISearchBar?
    
    
    //DUMMY
    var data : NSMutableArray = NSMutableArray()
//    var productList = [Product]()
    var searchResult = NSMutableArray()
//    var productSearchList = [Product]()
    
    var searchBar = UISearchBar(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: UIScreen.main.bounds.width-44, height: CGFloat(44)))
    
    
//    var searchView = UIView(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: UIScreen.main.bounds.width-44, height: CGFloat(44)))
//
//    var searchCancelButton = UIButton(frame:CGRect(x: UIScreen.main.bounds.width-100, y: CGFloat(0), width: 60, height: CGFloat(44)))
//

    
    var subCategory = "All"
    var sort = "Price low to High"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
  self.SubCategoryBtn.set(anImage: UIImage(named:"icons8-sort_down_filled"), title: "All", titlePosition: .left, additionalSpacing: 5, state: .normal)
        
         self.OrderBtn.set(anImage: UIImage(named:"icons8-sort_down_filled"), title: "Price Low to High", titlePosition: .left, additionalSpacing: 5, state: .normal)
    
        
       
        self.productsCollectionView.delegate = self
        self.productsCollectionView.dataSource = self
        
        self.searchBar.delegate = self
        
        
//        productList = dammyData()
        
      
        for product in dammyData(){
            
            data.add(product)
            
        }
        
        print("data.count\(data.count)")
        
        
        
//
        // Do any additional setup after loading the view.
    }

    @IBAction func searchClicked(_ sender: Any) {
        
        
//        self.searchCancelButton.setTitle("Cancel", for:.normal)
//         self.searchCancelButton.setTitleColor(mainColor, for: .normal)
//
//          self.searchCancelButton.addTarget(self, action: #selector(cancelSearch), for: .touchUpInside)
//
//        self.searchView.addSubview(self.searchBar)
//        self.searchView.addSubview(self.searchCancelButton)
        
        
        
        searchBar.showsCancelButton = true
        
    
        
        
        
        var rightNavBarItems = UIBarButtonItem(customView:searchBar)
         self.navigationItem.rightBarButtonItem = rightNavBarItems
        
        
        
        
        
    }
    
//
//    @objc func cancelSearch(){
//
//        print("cancelSearch")
////        self.searchView.isHidden = true
//
//        self.searchBar.removeFromSuperview()
//
//        self.searchBar.text = ""
//
////         searchBar.resignFirstResponder()
////
////        self.productsCollectionView.reloadData()
//
//    }
    
    
    
//
    
    
   
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("[ViewController searchBar] searchText: \(searchText)")
        searchResult = NSMutableArray()
        
        for index in 0...self.data.count-1 {
            
            let product = data[index] as! Product
            
            if product.name.lowercased().contains(searchText.lowercased())
            {
                searchResult.add(product)
            }
            
        }
        
        
        self.productsCollectionView.reloadData()
        
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
         self.searchBar.resignFirstResponder()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }

    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        searchResult = NSMutableArray()
        self.productsCollectionView.reloadData()
        self.searchBar.text = ""
        
        self.searchBar.resignFirstResponder()
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
      self.searchBar.resignFirstResponder()
    }
    
    
    
   
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.searchBar.resignFirstResponder()
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return productList.count
        
        
        if searchResult.count == 0 && !(self.searchBar.text?.isEmpty)!
        {
              print("searchRsult:\(searchResult.count)")
            return 0
        }
        else if searchResult.count != 0{
            
            print("productSearchList.count1:\(searchResult.count)")
            return searchResult.count
        }
        else {
              print("productSearchList.count2:\(searchResult.count)")
            return self.data.count
        }
    }
    
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        var product:Product
        
        if(self.searchResult.count != 0)
        {
            product = self.searchResult[indexPath.row] as! Product
        }
        else
        {
            product = self.data[indexPath.row] as! Product
        }
        
      
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath as IndexPath) as! ProductCollectionViewCell
        

        SDWebImageManager.shared().loadImage(with: URL(string:product.imageURL) as URL!, options: SDWebImageOptions.continueInBackground, progress: { (receivedSize :Int, ExpectedSize :Int, url : URL) in
            
            } as? SDWebImageDownloaderProgressBlock, completed: { (image : UIImage?, any : Data?,error : Error?, cacheType : SDImageCacheType, finished : Bool, url : URL?) in
                
                if (error != nil)  {
                    
                    print("error:\(error),\(url),\(finished)")
                    
                }
                else {
                    
                    cell.productImage?.image = image
                    cell.productImage.contentMode = .scaleToFill
                    
                }
        })
        
        
    
        cell.productTitleLabel.text = product.name
        cell.layer.cornerRadius = 8
        
        return cell
        
    }

    @IBAction func SelectSubCategory(_ sender: Any) {
        
        let plasterBoard = ["All","Speciality Plasterboard","General plasterboard","Plaster compounds","Plater cornice &cover"]
        
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
    
    
    func dammyData() ->[Product]{
        
        
    
        let prodcut1 = Product()
        prodcut1.name = "100mm 4 Step Cornice 4800mm 210/pallet"
        prodcut1.imageURL = "http://www.humeplaster.com.au/hume/wp-content/uploads/2016/09/CORN4ST48-270x250.jpg"
        
        
        let prodcut2 = Product()
        prodcut2.name = "100mm 4 Step Cornice 4800mm 210/pallet"
        prodcut2.imageURL = "http://www.humeplaster.com.au/hume/wp-content/uploads/2016/09/BORC100-270x250.jpg"
        
        
        
        let prodcut3 = Product()
        prodcut3.name = "10mm recessed edge ceiling board"
        prodcut3.imageURL =  "http://www.humeplaster.com.au/hume/wp-content/uploads/2016/09/10CBM2-270x250.jpg"
        
        
        
        let prodcut4 = Product()
        prodcut4.name = "10mm recessed edge wall board"
        prodcut4.imageURL =  "http://www.humeplaster.com.au/hume/wp-content/uploads/2016/09/10SBM2-270x250.jpg"
        
        
        let prodcut5 = Product()
        prodcut5.name = "10mm recessed edge Water Resistant Plasterboard"
        prodcut5.imageURL = "http://www.humeplaster.com.au/hume/wp-content/uploads/2016/09/10REM2-270x250.jpg"
        
        
        
        let prodcut6 = Product()
        prodcut6.name = "13mm Perforated Plasterboard"
        prodcut6.imageURL = "http://www.humeplaster.com.au/hume/wp-content/uploads/2016/09/10WRM2-270x250.jpg"
        
        
        let prodcut7 = Product()
        prodcut7.name = "13mm recessed edge Fire Resistant Plasterboard"
        prodcut7.imageURL =  "http://www.humeplaster.com.au/hume/wp-content/uploads/2016/09/13PERM2-270x250.jpg"
        
        
        let prodcut8 = Product()
        prodcut8.name = "13mm recessed edge Sound Proof Plasterboard"
        prodcut8.imageURL = "http://www.humeplaster.com.au/hume/wp-content/uploads/2016/09/13SBM2-270x250.jpg"
        
        
        
        let productList = [prodcut1,prodcut2,prodcut3,prodcut4,prodcut5,prodcut6,prodcut7,prodcut8]
        
        return productList
    }
    
    
    
//    func createSearchBar() {
//
//        searchBar = UISearchBar(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(320), height: CGFloat(44)))
//        searchBar?.showsCancelButton = true
//        searchBar?.delegate = self
//
//
//
//
//
//    }
    
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
