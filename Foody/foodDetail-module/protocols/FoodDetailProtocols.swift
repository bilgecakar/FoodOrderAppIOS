//
//  FoodDetailProtocols.swift
//  Foody
//
//  Created by Bilge Çakar on 29.03.2022.
//

import Foundation

protocol ViewToPresenterFoodDetailProtocol
{
    var foodDetailInteractor : PresenterToInterActorFoodDetailProtocol? {get set}
    func addAllCart(yemek_adi : String, yemek_fiyat : String, yemek_resim_adi : String, yemek_siparis_adet:String, kullanici_adi:String)
}
protocol PresenterToInterActorFoodDetailProtocol
{
   func addCart(yemek_adi : String, yemek_fiyat : String, yemek_resim_adi : String, yemek_siparis_adet:String, kullanici_adi:String)
}

protocol PresenterToRouterFoodDetailProtocol
{
    static func createModule(ref : FoodsDetailViewController)
}
