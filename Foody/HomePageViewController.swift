//
//  HomePageViewController.swift
//  Foody
//
//  Created by Bilge Çakar on 27.03.2022.
//

import UIKit

class HomePageViewController: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var foodCollectionView: UICollectionView!
    
    var categoryList = [Categories]()
    var foodList = [Foods]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        foodCollectionView.delegate = self
        foodCollectionView.dataSource = self
        
        let pizza = Categories(image: "Pizza")
        let iceCream = Categories(image: "IceCream")
        let burger = Categories(image: "Burger")
        let noodle = Categories(image: "Noodle")
        
        categoryList.append(pizza)
        categoryList.append(iceCream)
        categoryList.append(burger)
        categoryList.append(noodle)
        
        
        let foodOne = Foods(foodId: 1, foodName: "Honey Garlic Salmon", foodDescription: "Honey, Garlic, Lime", foodPrice: 89, foodImage: "Meal2")
        let foodTwo = Foods(foodId: 2, foodName: "Cheesy Rice Beans", foodDescription: "Rice, Beans, Orange", foodPrice: 34, foodImage: "Meal2")
        let foodThree = Foods(foodId: 3, foodName: "Honey Garlic Salmon", foodDescription: "Honey, Garlic, Lime", foodPrice: 89, foodImage: "Meal2")
        let foodFour = Foods(foodId: 4, foodName: "Cheesy Rice Beans", foodDescription: "Rice, Beans, Orange", foodPrice: 34, foodImage: "Meal2")
        
        foodList.append(foodOne)
        foodList.append(foodTwo)
        foodList.append(foodThree)
        foodList.append(foodFour)
        
        
        
        //Category collectionview tasarim
        let categoryTasarim = UICollectionViewFlowLayout()
        categoryTasarim.sectionInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 10)
        categoryTasarim.minimumLineSpacing = 10 //Dikey
        categoryTasarim.minimumInteritemSpacing = 10 //Yatay
        let genislik = categoryCollectionView.frame.size.width / 1.5
        let hucreGenislik = (genislik-40) / 3
        categoryTasarim.itemSize = CGSize(width: hucreGenislik, height: hucreGenislik*1.1)
        categoryCollectionView.collectionViewLayout = categoryTasarim
        
        
        //Category collectionview tasarim
        let foodTasarim = UICollectionViewFlowLayout()
        foodTasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        foodTasarim.minimumLineSpacing = 15 //Dikey
        
        let width = foodCollectionView.frame.size.width
        let cellWidht = (width-20)
        foodTasarim.itemSize = CGSize(width: cellWidht, height: cellWidht*0.4)
        foodCollectionView.collectionViewLayout = foodTasarim
        
    }
    
}

extension HomePageViewController : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoryCollectionView
        {
            return categoryList.count
        }else{
            return foodList.count
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == categoryCollectionView
        {
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
        }else{
            let food = foodList[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "foodCell", for: indexPath) as! FoodsCollectionViewCell
            cell.foodNameLabel.text = food.foodName!
            cell.foodDecsLabel.text = food.foodDescription!
            cell.foodPriceLabel.text = "$\(food.foodPrice!)"
            cell.foodImageview.image = UIImage(named: "\(food.foodImage!)")
            
           
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
}
