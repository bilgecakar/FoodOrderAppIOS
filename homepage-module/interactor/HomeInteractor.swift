//
//  HomeInteractor.swift
//  Foody
//
//  Created by Bilge Çakar on 28.03.2022.
//

import Foundation

class HomeInteractor : PresenterToInteractorHomaPageProtocol
{
    var homepagePresenter: InteractorToPresenterHomePageProtocol?
    
    func showAllFoods() {
        var foodList = [Foods]()
        
        let foodOne = Foods(foodId: 1, foodName: "Honey Garlic Salmon", foodDescription: "Honey, Garlic, Lime", foodPrice: 89, foodImage: "Meal2")
        let foodTwo = Foods(foodId: 2, foodName: "Cheesy Rice Beans", foodDescription: "Rice, Beans, Orange", foodPrice: 34, foodImage: "Meal2")
        let foodThree = Foods(foodId: 3, foodName: "Honey Garlic Salmon", foodDescription: "Honey, Garlic, Lime", foodPrice: 89, foodImage: "Meal2")
        let foodFour = Foods(foodId: 4, foodName: "Cheesy Rice Beans", foodDescription: "Rice, Beans, Orange", foodPrice: 34, foodImage: "Meal2")
        
        foodList.append(foodOne)
        foodList.append(foodTwo)
        foodList.append(foodThree)
        foodList.append(foodFour)
        
        homepagePresenter?.sendDataToPresenter(foods: foodList)
    }    
    
}
