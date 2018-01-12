//
//  CatogeryViewController.swift
//  Hume Sales
//
//  Created by MileyLiu on 10/1/18.
//  Copyright © 2018 MileyLiu. All rights reserved.
//

import UIKit
import SDWebImage
class CatogeryViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    var dataArr = NSMutableArray()//数据源
    var categoryList = [Category]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        let titleImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 40, height: 40))
        
        titleImageView.image = UIImage(named:"titleLogo")
        titleImageView.contentMode = .scaleAspectFit
        
        self.navigationItem.titleView = titleImageView
        
        self.categoryCollectionView.delegate = self
        self.categoryCollectionView.dataSource = self
        
        categoryList = dataSource()
        
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryList.count
    }

    
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath as IndexPath) as! CategoryCollectionViewCell
        
       
//        DispatchQueue.global(qos: .background).async {
            print("Run on background thread")
//            let imageURL = NSURL(string: "http://www.humeplaster.com.au/hume/wp-content/uploads/2016/09/CORN4ST48.jpg")
            SDWebImageManager.shared().loadImage(with: URL(string:self.categoryList[indexPath.row].imageURL) as URL!, options: SDWebImageOptions.continueInBackground, progress: { (receivedSize :Int, ExpectedSize :Int, url : URL) in
            
                        } as? SDWebImageDownloaderProgressBlock, completed: { (image : UIImage?, any : Data?,error : Error?, cacheType : SDImageCacheType, finished : Bool, url : URL?) in
            
                            if (error != nil)  {
            
                                print("error:\(error),\(url),\(finished)")
            
                            }
                            else {
            
                                 cell.categoryImage?.image = image
            
                            }
        })
            
            
//        }
        

        cell.categoryLabel.text = self.categoryList[indexPath.row].name
        
        cell.layer.cornerRadius = 8
//        print("\(indexPath.row):\(self.categoryList[indexPath.row].name)")
        
        
//        let oneSpecial = dataArr[indexPath.row] as! Special
//        cell.titleLabel?.text = oneSpecial.name
//
//
//        SDWebImageManager.shared().loadImage(with: URL(string:oneSpecial.imageUrl!) as URL!, options: SDWebImageOptions.continueInBackground, progress: { (receivedSize :Int, ExpectedSize :Int, url : URL) in
//
//            } as? SDWebImageDownloaderProgressBlock, completed: { (image : UIImage?, any : Data?,error : Error?, cacheType : SDImageCacheType, finished : Bool, url : URL?) in
//
//                cell.productImage.image = image
//        })
//        cell.priceLabel?.text = oneSpecial.price
//
//        cell.addCarButton.tag = indexPath.row
//
//        cell.productImage.tag = indexPath.row
//        cell.productImage.isUserInteractionEnabled = true
//
//        cell.layer.cornerRadius = 10
        
        return cell
        
    }
    
    func dataSource () ->[Category]{
        
        
        let plaster = Category()
        plaster.name = "Plaster Products"
        plaster.imageURL = "http://www.humeplaster.com.au/hume/wp-content/uploads/2016/05/categories-img1.jpg"
        
        
        let fibre = Category()
        fibre.name = "Fibre Cement Product & Coatings"
        fibre.imageURL = "http://www.humeplaster.com.au/hume/wp-content/uploads/2016/05/categories-img3.jpg"
        
        let metals = Category()
        metals.name = "Mentals"
        metals.imageURL = "http://www.humeplaster.com.au/hume/wp-content/uploads/2016/09/Metals.jpg"
        
        let insulation = Category()
        insulation.name = "Insulation & Ceiling Tiles"
        insulation.imageURL = "http://www.humeplaster.com.au/hume/wp-content/uploads/2016/09/Insulation-Ceiling-Tiles.jpg"
        
        let openings = Category()
        openings.name = "Openings"
        openings.imageURL = "http://www.humeplaster.com.au/hume/wp-content/uploads/2016/09/Openings.jpg"
        
        let tools = Category()
        tools.name = "Tools & Accesories"
        tools.imageURL = "http://www.humeplaster.com.au/hume/wp-content/uploads/2016/09/Tools-Accessories.jpg"
        
        let categoryList = [plaster,fibre,metals,insulation,openings,tools]
        return categoryList
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
       
        self.performSegue(withIdentifier: "toProductList", sender: categoryList[indexPath.row].name)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toProductList" {
            
            let nextViewController = segue.destination as! ProductsListViewController
            
            nextViewController.title = sender as! String
        }
        
    
    }
   

}
