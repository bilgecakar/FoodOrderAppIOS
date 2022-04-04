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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
