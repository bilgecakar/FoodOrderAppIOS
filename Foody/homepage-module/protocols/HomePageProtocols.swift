//
//  HomePageProtocols.swift
//  Foody
//
//  Created by Bilge Çakar on 28.03.2022.
//

import Foundation

protocol ViewToPresenterHomePageProtocol // Presenter
{
    var homepageInteractor : PresenterToInteractorHomaPageProtocol? {get set}
    var homepageView : PresenterToViewHomePageProtocol? {get set}
    
   func showFoods()
    func showFoodCount()
}

protocol PresenterToInteractorHomaPageProtocol //Interactor
{
    var homepagePresenter : InteractorToPresenterHomePageProtocol? {get set}
    
    func showAllFoods()
    func showFoodCount()
}

protocol InteractorToPresenterHomePageProtocol
{
    func sendDataToPresenter(foods : Array<Foods>)
    func sendDataTopRresenter(foodCount : Int)
}

protocol PresenterToViewHomePageProtocol
{
    func sendDataToView(foods : Array<Foods>)
    func sendDataToView(foodCount : Int)
}

protocol PresenterToRouterHomePageProtocol
{
    static func createModule(ref : HomePageViewController)
}



