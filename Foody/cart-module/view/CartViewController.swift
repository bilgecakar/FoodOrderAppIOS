//
//  CartViewController.swift
//  Foody
//
//  Created by Bilge Çakar on 30.03.2022.
//

import UIKit

class CartViewController: UIViewController {
    
    
    @IBOutlet weak var cartTableview: UITableView!
    
    @IBOutlet weak var foodTotalPrice: UILabel!
    var cartFoods = [FoodsDetail]()
    var cartPresenterObject : ViewToPresenterCartProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cartTableview.delegate = self
        cartTableview.dataSource = self
        
        CartRouter.createModule(ref: self)
    
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        cartPresenterObject?.showAllCart()
    }
    
        
    @IBAction func payment(_ sender: Any) {
        
        
    }
    
}

extension CartViewController : PresenterToViewCartProtocol
{
    func sendDataToView(cartList: Array<FoodsDetail>) {
        self.cartFoods = cartList
        var total = 0
        
        DispatchQueue.main.async {
            
            self.cartFoods.forEach{   cart_food in
                
                total = total  + (Int(cart_food.yemek_fiyat!)! * Int(cart_food.yemek_siparis_adet!)!)
                
            }
            
            
            self.foodTotalPrice.text = "₺\(total)"
            self.cartTableview.reloadData()
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
    
}




