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
    var food : Foods?
    
    var foodDetailPresenterObject : ViewToPresenterFoodDetailProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        if let f = food{
            foodNameLabel.text = f.yemek_adi
            foodPriceLabel.text = f.yemek_fiyat
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
    

}
