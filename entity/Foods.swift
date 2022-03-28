//
//  Foods.swift
//  Foody
//
//  Created by Bilge Çakar on 28.03.2022.
//

import Foundation

class Foods
{
    var foodId : Int?
    var foodName : String?
    var foodDescription : String?
    var foodPrice : Int?
    var foodImage : String?
    
    init(foodId : Int, foodName : String, foodDescription : String, foodPrice : Int, foodImage : String )
    {
        self.foodId = foodId
        self.foodName = foodName
        self.foodDescription = foodDescription
        self.foodPrice = foodPrice
        self.foodImage = foodImage
    }
}
