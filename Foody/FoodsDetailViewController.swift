//
//  FoodsDetailViewController.swift
//  Foody
//
//  Created by Bilge Çakar on 29.03.2022.
//

import UIKit

class FoodsDetailViewController: UIViewController {

    
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var addToCartButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI()
    {
        plusButton.layer.cornerRadius = 10
        minusButton.layer.cornerRadius = 10
        addToCartButton.layer.cornerRadius = 10
        favoriteButton.layer.cornerRadius = 20
    }
    

}
