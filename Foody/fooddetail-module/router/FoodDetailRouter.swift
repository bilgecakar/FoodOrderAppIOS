//
//  FoodDetailRouter.swift
//  Foody
//
//  Created by Bilge Çakar on 29.03.2022.
//

import Foundation

class FoodDetailRouter : PresenterToRouterFoodDetailProtocol
{
    static func createModule(ref: FoodsDetailViewController) {
        ref.foodDetailPresenterObject = FoodDetailPresenter()
        ref.foodDetailPresenterObject?.foodDetailInteractor = FoodDetailInteractor()
    }
}
