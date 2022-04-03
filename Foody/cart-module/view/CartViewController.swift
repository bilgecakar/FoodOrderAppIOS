//
//  CartViewController.swift
//  Foody
//
//  Created by Bilge Çakar on 30.03.2022.
//

import UIKit
import Firebase

class CartViewController: UIViewController {
    
    
    @IBOutlet weak var cartTableview: UITableView!
    @IBOutlet weak var foodTotalPrice: UILabel!
    
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var emptyCartStack: UIStackView!
    @IBOutlet weak var paymentStack: UIStackView!
    
    var cartFoods = [FoodsDetail]()
    var cartPresenterObject : ViewToPresenterCartProtocol?
    
    var foodsCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cartTableview.delegate = self
        cartTableview.dataSource = self
        
        CartRouter.createModule(ref: self)
        
        hiddenUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cartPresenterObject?.showAllCart()
        cartPresenterObject?.showCount()
        
    }
    
    @IBAction func payment(_ sender: Any) {
        
    }
    
    @IBAction func deleteCart(_ sender: Any) {
        
        cartPresenterObject?.allDeleteItems(carts: cartFoods)
        performSegue(withIdentifier: "toHomepage", sender: nil)
    }
    
    func hiddenUI()
    {
        paymentStack.isHidden = true
        emptyCartStack.isHidden = false
        deleteButton.isHidden = true
        
    }
    
    func notHiddenUI()
    {
        paymentStack.isHidden = false
        emptyCartStack.isHidden = true
        deleteButton.isHidden = false
    }
    
    
}


extension CartViewController : PresenterToViewCartProtocol
{
    
    func sendDataToView(foodCount: Int) {
        self.foodsCount = foodCount
        
        DispatchQueue.main.async {
            self.cartTableview.reloadData()
            self.tabBarController?.tabBar.items![1].badgeValue = "\(self.foodsCount)"
            self.tabBarController?.tabBar.items![1].badgeColor = UIColor(named: "SecondyColor")
            
            if self.foodsCount >= 1
            {
                
                self.notHiddenUI()
            }
            
            print(self.foodsCount)
        
        }
        
    }
    
    
    func sendDataToView(cartList: Array<FoodsDetail>) {
        self.cartFoods = cartList
        
        
        DispatchQueue.main.async {
            self.cartTableview.reloadData()
            
            var total = 0
            
            self.cartFoods.forEach{   cart_food in
                
                total = total  + (Int(cart_food.yemek_fiyat ?? "0")! * Int(cart_food.yemek_siparis_adet ?? "0")!)
                
            }
            self.foodTotalPrice.text = "₺\(total)"
        }
        
       
        
    }
    
}



extension CartViewController : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartFoods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cartFood = cartFoods[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as! CartTableViewCell
        cell.foodNameLabel.text = cartFood.yemek_adi!
        cell.foodPriceLabel.text = "₺\(Int(cartFood.yemek_fiyat!)!)"
        cell.foodCount.text = cartFood.yemek_siparis_adet!
        
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(cartFood.yemek_resim_adi!)")
        {
            DispatchQueue.main.async {
                cell.foodImageView.kf.setImage(with : url)
                
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){ (contextualAction,view,bool) in
            
            let cart = self.cartFoods[indexPath.row]
            
            self.cartFoods.remove(at: indexPath.row)
            
            self.cartPresenterObject?.deleteAllCart(cart: cart, kullanici_adi: "\(Auth.auth().currentUser?.email ?? "")")
            
            tableView.reloadData()
            
            self.foodsCount -= 1
            
            self.tabBarController?.tabBar.items![1].badgeValue = "\(self.foodsCount)"
            
            if self.foodsCount == 0
            {
                self.tabBarController?.tabBar.items![1].badgeValue = nil
                self.performSegue(withIdentifier: "toHomepage", sender: nil)
            }
            print(self.foodsCount)
            
       
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
}




