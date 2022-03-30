//
//  CartPresenter.swift
//  Foody
//
//  Created by Bilge Çakar on 30.03.2022.
//

import Foundation

class CartPresenter : ViewToPresenterCartProtocol
{
    var cartInteractor: PresenterToInteractorCartProtocol?
    
    var cartView: PresenterToViewCartProtocol?
    
    func showAllCart() {
        cartInteractor?.showCart()
    }
    func deleteAllCart(sepet_yemek_id: String, kullanici_adi: String) {
        cartInteractor?.deleteCart(sepet_yemek_id: sepet_yemek_id, kullanici_adi: kullanici_adi)
    }
    
    
}

extension CartPresenter : InteractorToPresenterCartProtocol
{
    func sendDataToPresenter(cartList: Array<FoodsDetail>) {
        cartView?.sendDataToView(cartList: cartList)
    }
    
    
}
