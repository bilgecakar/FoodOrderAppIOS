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
    func deleteAllCart(cart: FoodsDetail, kullanici_adi: String)
    func allDeleteItems(carts : Array<FoodsDetail>)
    
}

protocol PresenterToInteractorCartProtocol
{
    var cartPresenter : InteractorToPresenterCartProtocol? {get set}
    
    func showCart()
    func deleteCart(cart: FoodsDetail, kullanici_adi: String)
    func allDeleteItems(carts : Array<FoodsDetail>)
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
