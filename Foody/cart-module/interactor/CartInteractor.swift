//
//  CartInteractor.swift
//  Foody
//
//  Created by Bilge Çakar on 30.03.2022.
//

import Foundation
import Alamofire

class CartInteractor : PresenterToInteractorCartProtocol
{
    var cartPresenter: InteractorToPresenterCartProtocol?
    
    func showCart() {
        
        let param : Parameters = ["kullanici_adi" : "Blg"]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php", method: .post, parameters: param).responseJSON{ response in
            if let data = response.data
            {
                do {
                    let answer = try JSONDecoder().decode(FoodDetailResponse.self, from: data)
                    var list = [FoodsDetail]()
                    if let answerList = answer.sepet_yemekler
                    {
                        list = answerList
                    }
                    
                    self.cartPresenter?.sendDataToPresenter(cartList: list)
                    print(list)
                    
                } catch  {
                    print(error.localizedDescription)
                }
            }
            
        }
        
    }
    
    func deleteCart(sepet_yemek_id: String, kullanici_adi: String) {
        
        let param : Parameters = ["sepet_yemek_id" : sepet_yemek_id, "kullanici_adi" : "Blg"]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php", method: .post, parameters: param).response{ response in
            if let data = response.data {
                do{
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        print(json)
                        self.showCart()
                        
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
            
        }
        
    }
    
    
}
