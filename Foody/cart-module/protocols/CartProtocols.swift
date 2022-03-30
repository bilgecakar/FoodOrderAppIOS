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
}

protocol PresenterToInteractorCartProtocol
{
    var cartPresenter : InteractorToPresenterCartProtocol? {get set}
    
    func showCart()
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
