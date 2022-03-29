//
//  FoodDetailPresenter.swift
//  Foody
//
//  Created by Bilge Çakar on 29.03.2022.
//

import Foundation

class FoodDetailPresenter : ViewToPresenterFoodDetailProtocol
{
    var foodDetailInteractor: PresenterToInterActorFoodDetailProtocol?
    
    func showAllDetail(sepet_yemek_id: String, yemek_adi: String, yemek_fiyat: String, yemek_resim_adi: String, yemek_siparis_adet: String, kullanici_adi: String) {
        
        foodDetailInteractor?.showDetail(sepet_yemek_id: sepet_yemek_id, yemek_adi: yemek_adi, yemek_fiyat: yemek_fiyat, yemek_resim_adi: yemek_resim_adi, yemek_siparis_adet: yemek_siparis_adet, kullanici_adi: kullanici_adi)
    }
    
    
}
