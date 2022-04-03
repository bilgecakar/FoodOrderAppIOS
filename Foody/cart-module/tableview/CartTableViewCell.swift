//
//  CartTableViewCell.swift
//  Foody
//
//  Created by Bilge Çakar on 30.03.2022.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var foodCount: UILabel!
    @IBOutlet weak var foodPriceLabel: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    @IBAction func addition(_ sender: Any) {
        add()
    }
    
    
    @IBAction func subtraction(_ sender: Any) {
        subtract()
    }
    
    func add() {
        
        var count = 1
        if let temp = Int(foodCount.text!)
        {
            count = temp
        }
        
        if count >= 1 && count < 20
        {
            count += 1
        }
        foodCount.text = "\(count)"
        
    }
    
    func subtract() {
        
        var count = 1
        if let temp = Int(foodCount.text!)
        {
            count = temp
        }
        
        if count > 1 && count <= 20
        {
            count -= 1
        }
        foodCount.text = "\(count)"
        
    }
}
