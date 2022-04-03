//
//  FoodDetailResponse.swift
//  Foody
//
//  Created by Bilge Çakar on 29.03.2022.
//

import Foundation

class FoodDetailResponse : Codable
{
    var sepet_yemekler : [FoodsDetail]?
    var success : Int?
}
