//
//  FoodsDetailViewController.swift
//  Foody
//
//  Created by Bilge Çakar on 29.03.2022.
//

import UIKit
import Kingfisher

class FoodsDetailViewController: UIViewController {

    
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var addToCartButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var foodPriceLabel: UILabel!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var foodImageview: UIImageView!
    
    var count : Int = 1
    var food : Foods?
    
    var foodDetailPresenterObject : ViewToPresenterFoodDetailProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        if let f = food{
            foodNameLabel.text = f.yemek_adi
            foodPriceLabel.text = "₺\(f.yemek_fiyat!)"
            if let url = URL(string : "http://kasimadalan.pe.hu/yemekler/resimler/\(f.yemek_resim_adi!)")
            {
                DispatchQueue.main.async {
                    self.foodImageview.kf.setImage(with : url)
                }
            }
            
                        
        }
        
        FoodDetailRouter.createModule(ref: self)
    }
    
    func updateUI()
    {
        plusButton.layer.cornerRadius = 10
        minusButton.layer.cornerRadius = 10
        addToCartButton.layer.cornerRadius = 10
        favoriteButton.layer.cornerRadius = 20
        
    }
    
    @IBAction func increaseCount(_ sender: Any) {
        add()
    }
    
    @IBAction func decreaseCount(_ sender: Any) {
       subtract()
    }
    
    @IBAction func addCart(_ sender: Any) {
        if let f = food{
            foodDetailPresenterObject?.addAllCart(yemek_adi: f.yemek_adi!, yemek_fiyat: f.yemek_fiyat!, yemek_resim_adi: f.yemek_resim_adi!, yemek_siparis_adet: String(count), kullanici_adi: "Blg")
            
            let alert = UIAlertController(title: "Add To Cart", message: "\(f.yemek_adi!) added to cart!", preferredStyle: .alert)
                      let OKAction = UIAlertAction(title: "Okay", style: .default){ action in
                          self.navigationController?.popToRootViewController(animated: true)
                      }
                      alert.addAction(OKAction)

                      
                      self.present(alert, animated: true)
            
            
            
        }
    }
    
    
    func add()
    {
        if count >= 1 && count < 20
        {
            count += 1
        }
        countLabel.text = "\(count)"
        
        if let f = food
        {
            let dataPrice = Int(f.yemek_fiyat!)
            foodPriceLabel.text = "₺\(dataPrice! * count)"
        }
    }
    
    func subtract()
    {
        if count > 1 && count <= 20
        {
            count -= 1
        }
        countLabel.text = "\(count)"
        
        if let f = food
        {
            let dataPrice = Int(f.yemek_fiyat!)
            foodPriceLabel.text = "₺\(dataPrice! * count)"
        }
    }
    
    
}
