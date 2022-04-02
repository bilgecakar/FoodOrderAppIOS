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
    
    var count : Int  = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func add(_ sender: Any) {
    }
    
    @IBAction func subtract(_ sender: Any) {
    }
}
