//
//  HomePageViewController.swift
//  Foody
//
//  Created by Bilge Çakar on 27.03.2022.
//

import UIKit
import Kingfisher
import Firebase

class HomePageViewController: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var foodCollectionView: UICollectionView!
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var categoryList = [Categories]()
    var foodList = [Foods]()
    
    var homepagePresenterOnject : ViewToPresenterHomePageProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameLabel.text = Auth.auth().currentUser?.email
        print(Auth.auth().currentUser?.email)
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        foodCollectionView.delegate = self
        foodCollectionView.dataSource = self
        
        activityIndicator.startAnimating()
        
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
        
        
        //Food collectionview UI
        let foodTasarim = UICollectionViewFlowLayout()
        foodTasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        foodTasarim.minimumLineSpacing = 10
        foodTasarim.minimumInteritemSpacing = 10
        let width = foodCollectionView.frame.size.width
        let cellWidht = (width - 30) / 2
        foodTasarim.itemSize = CGSize(width: cellWidht, height: cellWidht*1.1)
        foodCollectionView.collectionViewLayout = foodTasarim
        
        HomeRouter.createModule(ref: self)
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        homepagePresenterOnject?.showFoods()
        homepagePresenterOnject?.showFoodCount()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFoodDetail" {
            let food = sender as? Foods
            let destinationVC = segue.destination as! FoodsDetailViewController
            destinationVC.food = food
        }
    }
}

extension HomePageViewController : PresenterToViewHomePageProtocol
{
    
    func sendDataToView(foodCount: Int) {
        self.tabBarController?.tabBar.items![2].badgeValue = "\(foodCount)"
        self.tabBarController?.tabBar.items![2].badgeColor = UIColor(named: "SecondyColor")
    }
    
    func sendDataToView(foods: Array<Foods>) {
        
        self.foodList = foods
        DispatchQueue.main.async {
            
            self.foodCollectionView.reloadData()
            self.activityIndicator.stopAnimating()
        }
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
            cell.foodNameLabel.text = food.yemek_adi!
            cell.foodPriceLabel.text = "₺\(food.yemek_fiyat!)"
            if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(food.yemek_resim_adi!)")
            {
                DispatchQueue.main.async {
                    cell.foodImageview.kf.setImage(with : url)
                    
                }
            }
            
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == foodCollectionView
        {
            let food = foodList[indexPath.row]
            performSegue(withIdentifier: "toFoodDetail", sender: food)
                    
        }
    }

}
