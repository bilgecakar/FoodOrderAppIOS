//
//  HomeInteractor.swift
//  Foody
//
//  Created by Bilge Çakar on 28.03.2022.
//

import Foundation
import Alamofire


class HomeInteractor : PresenterToInteractorHomaPageProtocol
{
    var homepagePresenter: InteractorToPresenterHomePageProtocol?
    
    func showAllFoods() {
        
        AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php",method:.get).response { response in
            
            if let data = response.data {
                do {
                    let answer = try JSONDecoder().decode(FoodsResponse.self, from: data)
                    var list = [Foods]()
                    
                    if let answerList = answer.yemekler {
                        list = answerList
                    }
                    
                    self.homepagePresenter?.sendDataToPresenter(foods: list)
                } catch {
                    print(error.localizedDescription)
                    
                }
            }
        }
        
    }
    
    func showFoodCount() {
        
        let param : Parameters = ["kullanici_adi" : "Blg"]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php", method: .post, parameters: param).responseJSON{ response in
            if let data = response.data
            {
                do {
                    let answer = try JSONDecoder().decode(FoodDetailResponse.self, from: data)
                    var list = [FoodsDetail]()
                    if let answerList = answer.sepet_yemekler
                    {
                        list = answerList
                    }
                    print(list)
                    self.homepagePresenter?.sendDataTopRresenter(foodCount: list.count);
                    
                } catch  {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
