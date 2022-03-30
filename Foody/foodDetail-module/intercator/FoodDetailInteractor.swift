//
//  FoodDetailInteractor.swift
//  Foody
//
//  Created by Bilge Çakar on 29.03.2022.
//

import Foundation
import Alamofire

class FoodDetailInteractor : PresenterToInterActorFoodDetailProtocol
{
    func addCart(yemek_adi: String, yemek_fiyat: String, yemek_resim_adi: String, yemek_siparis_adet: String, kullanici_adi: String) {
        let params : Parameters = ["yemek_adi" : yemek_adi, "yemek_fiyat" : yemek_fiyat, "yemek_siparis_adet" : yemek_siparis_adet, "yemek_resim_adi" : yemek_resim_adi, "kullanici_adi" : kullanici_adi]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php", method: .post, parameters : params).response{
            response in
            if let data = response.data
            {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]
                    {
                        print(json)
                    }
                    
                } catch  {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
