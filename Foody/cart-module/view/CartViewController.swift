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
    
    @IBOutlet weak var paymentStack: UIStackView!
    var cartFoods = [FoodsDetail]()
    var cartPresenterObject : ViewToPresenterCartProtocol?
    
    var foodsCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cartTableview.delegate = self
        cartTableview.dataSource = self
        
        CartRouter.createModule(ref: self)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cartPresenterObject?.showAllCart()
        cartTableview.reloadData()
        
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
    }
    
    func notHiddenUI()
    {
        paymentStack.isHidden = false
    }
    
    
}


extension CartViewController : PresenterToViewCartProtocol
{
    func sendDataToView(cartList: Array<FoodsDetail>) {
        self.cartFoods = cartList
        
        
        DispatchQueue.main.async {
            self.cartTableview.reloadData()
            
            var total = 0
            
            self.tabBarController?.tabBar.items![1].badgeValue = self.cartFoods.count == 0 ? nil : "\(self.cartFoods.count)"
            
            self.cartFoods.forEach{   cart_food in
                
                total = total  + (Int(cart_food.yemek_fiyat!)! * Int(cart_food.yemek_siparis_adet!)!)
                
            }
            self.foodTotalPrice.text = "₺\(total)"
        }
        
        print(self.cartFoods.count)
        if self.cartFoods.count == 0 {
            let alert = UIAlertController(title: "Uyarı", message: "Sepetin şu an boş görünüyor.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yemekleri Listele", style: .default, handler: { (action: UIAlertAction!) in
                self.performSegue(withIdentifier: "toHomapage", sender: nil)
            }))
            self.present(alert, animated: true)
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
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
}




