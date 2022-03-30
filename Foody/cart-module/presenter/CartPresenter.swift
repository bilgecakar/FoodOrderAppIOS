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
    
    
}

extension CartPresenter : InteractorToPresenterCartProtocol
{
    func sendDataToPresenter(cartList: Array<FoodsDetail>) {
        cartView?.sendDataToView(cartList: cartList)
    }
    
    
}
