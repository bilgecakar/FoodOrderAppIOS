//
//  HomePageViewController.swift
//  Foody
//
//  Created by Bilge Çakar on 27.03.2022.
//

import UIKit

class HomePageViewController: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var categoryList = [Categories]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        let pizza = Categories(image: "Pizza")
        let iceCream = Categories(image: "IceCream")
        let burger = Categories(image: "Burger")
        let noodle = Categories(image: "Noodle")
        
        categoryList.append(pizza)
        categoryList.append(iceCream)
        categoryList.append(burger)
        categoryList.append(noodle)
        
        
        
        
        //Category collectionview tasarim
        let categoryTasarim = UICollectionViewFlowLayout()
        categoryTasarim.sectionInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 10)
        categoryTasarim.minimumLineSpacing = 10 //Dikey
        categoryTasarim.minimumInteritemSpacing = 10 //Yatay
        let genislik = categoryCollectionView.frame.size.width / 1.5
        let hucreGenislik = (genislik-40) / 3
        categoryTasarim.itemSize = CGSize(width: hucreGenislik, height: hucreGenislik*1.1)
        categoryCollectionView.collectionViewLayout = categoryTasarim
        
    }
    
}

extension HomePageViewController : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let category = categoryList[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoryCollectionViewCell
        cell.categoryImage.image = UIImage(named: category.image!)
        
        cell.contentView.layer.cornerRadius = 17
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = true;
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOffset = CGSize.zero
        cell.layer.shadowRadius = 7.0
        cell.layer.shadowOpacity = 0.4
        cell.layer.masksToBounds = false;
        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
        
        
        return cell
        
    }
}
