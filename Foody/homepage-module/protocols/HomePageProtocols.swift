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
}

protocol PresenterToInteractorHomaPageProtocol //Interactor
{
    var homepagePresenter : InteractorToPresenterHomePageProtocol? {get set}
    
    func showAllFoods()
}

protocol InteractorToPresenterHomePageProtocol
{
    func sendDataToPresenter(foods : Array<Foods>)
}

protocol PresenterToViewHomePageProtocol
{
    func sendDataToView(foods : Array<Foods>)
}

protocol PresenterToRouterHomePageProtocol
{
    static func createModule(ref : HomePageViewController)
}



