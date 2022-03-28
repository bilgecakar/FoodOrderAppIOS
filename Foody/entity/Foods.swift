//
//  Foods.swift
//  Foody
//
//  Created by Bilge Çakar on 28.03.2022.
//

import Foundation

class Foods : Codable
{
    var yemek_id : String?
    var yemek_adi : String?
    var yemek_fiyat : String?
    var yemek_resim_adi : String?
    
    init(){
        
    }
    
    init(yemek_id : String, yemek_adi : String, yemek_fiyat : String, yemek_resim_adi : String )
    {
        self.yemek_id = yemek_id
        self.yemek_adi = yemek_adi
        self.yemek_fiyat = yemek_fiyat
        self.yemek_resim_adi = yemek_resim_adi
    }
}
