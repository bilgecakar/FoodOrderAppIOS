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
    
    
    @IBOutlet weak var foodCollectionView: UICollectionView!
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var foodList = [Foods]()
    
    var homepagePresenterOnject : ViewToPresenterHomePageProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodCollectionView.delegate = self
        foodCollectionView.dataSource = self
        
        activityIndicator.startAnimating()
        
        
        //Food collectionview UI
        let foodTasarim = UICollectionViewFlowLayout()
        foodTasarim.sectionInset = UIEdgeInsets(top: 8, left: 3, bottom: 8, right: 3)
        foodTasarim.minimumLineSpacing = 20
        foodTasarim.minimumInteritemSpacing = 10
        let width = foodCollectionView.frame.size.width
        let cellWidht = (width - 30) / 2
        foodTasarim.itemSize = CGSize(width: cellWidht, height: cellWidht*1.1)
        foodCollectionView.collectionViewLayout = foodTasarim
        
        HomeRouter.createModule(ref: self)
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationItem.title = ""
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
        self.tabBarController?.tabBar.items![1].badgeValue = "\(foodCount)"
        self.tabBarController?.tabBar.items![1].badgeColor = UIColor(named: "SecondyColor")
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
        
        return foodList.count
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let food = foodList[indexPath.row]
        performSegue(withIdentifier: "toFoodDetail", sender: food)
        
        
    }
    
}
