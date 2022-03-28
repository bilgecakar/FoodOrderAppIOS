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
                    print(list)
                    self.homepagePresenter?.sendDataToPresenter(foods: list)
                } catch {
                    print(error.localizedDescription)
                    
                }
            }
        }
        
        //homepagePresenter?.sendDataToPresenter(foods: foodList)
    }
    
}
