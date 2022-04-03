//
//  CartInteractor.swift
//  Foody
//
//  Created by Bilge Çakar on 30.03.2022.
//

import Foundation
import Alamofire
import Firebase

class CartInteractor : PresenterToInteractorCartProtocol
{
    var cartPresenter: InteractorToPresenterCartProtocol?
    
    func showCart() {
        
        let param : Parameters = ["kullanici_adi" : "\(Auth.auth().currentUser?.email ?? "")"]
        
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
                    
                    
                } catch  {
                    print(error.localizedDescription)
                }
            }
            
        }
        
    }
    
    func deleteCart(cart: FoodsDetail, kullanici_adi: String) {
        
        let param : Parameters = ["sepet_yemek_id" : cart.sepet_yemek_id!, "kullanici_adi" : Auth.auth().currentUser?.email ?? ""]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php", method: .post, parameters: param).responseJSON{ response in
            if let data = response.data {
                do{
                    let json = try JSONDecoder().decode(FoodDetailResponse.self, from: data)
                        if json.success == 1 {
                            
                            self.showCart()
                            
                        }
                    
                }catch{
                    print(error.localizedDescription)
                }
            }
            
        }
        
    }
    
    func allDeleteItems(carts : Array<FoodsDetail>)
    {
        for cartItem in carts{
            DispatchQueue.main.async { [weak self] in
                self?.deleteCart(cart: cartItem, kullanici_adi: Auth.auth().currentUser?.email ?? "")
            }
        }
    }
    
    
}
