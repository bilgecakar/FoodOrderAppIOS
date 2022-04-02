//
//  SettingTableViewCell.swift
//  Foody
//
//  Created by Bilge Çakar on 2.04.2022.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

    
    @IBOutlet weak var settingNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
