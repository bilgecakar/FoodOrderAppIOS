//
//  HomePresenter.swift
//  Foody
//
//  Created by Bilge Çakar on 28.03.2022.
//

import Foundation

class HomePresenter : ViewToPresenterHomePageProtocol
{
    var homepageInteractor: PresenterToInteractorHomaPageProtocol?
    
    var homepageView: PresenterToViewHomePageProtocol?
    
    func showFoods() {
        homepageInteractor?.showAllFoods()
    }
    
    func showFoodCount() {
        homepageInteractor?.showFoodCount()
    }
    
    
}
extension HomePresenter : InteractorToPresenterHomePageProtocol
{
    func sendDataToPresenter(foods: Array<Foods>) {
        homepageView?.sendDataToView(foods: foods)
    }
    
    func sendDataTopRresenter(foodCount: Int) {
        homepageView?.sendDataToView(foodCount: foodCount)
    }
    
    
}
