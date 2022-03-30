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
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func add(_ sender: Any) {
    }
    
    @IBAction func subtract(_ sender: Any) {
    }
}
