//
//  CartProtocols.swift
//  Foody
//
//  Created by Bilge Çakar on 30.03.2022.
//

import Foundation

protocol ViewToPresenterCartProtocol
{
    var cartInteractor : PresenterToInteractorCartProtocol? {get set}
    var cartView : PresenterToViewCartProtocol? {get set}
    
    func showAllCart()
    func deleteAllCart(sepet_yemek_id: String, kullanici_adi: String)
}

protocol PresenterToInteractorCartProtocol
{
    var cartPresenter : InteractorToPresenterCartProtocol? {get set}
    
    func showCart()
    func deleteCart(sepet_yemek_id: String, kullanici_adi: String)

}

protocol InteractorToPresenterCartProtocol
{
    func sendDataToPresenter(cartList : Array<FoodsDetail>)
}

protocol PresenterToViewCartProtocol
{
    func sendDataToView(cartList : Array<FoodsDetail>)
}

protocol PresenterToRouterCartProtocol
{
    static func createModule(ref : CartViewController)
}
