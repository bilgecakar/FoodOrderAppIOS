//
//  ProfilePresenter.swift
//  Foody
//
//  Created by Bilge Çakar on 2.04.2022.
//

import Foundation

class ProfilePresenter : ViewToPresenterProfileProtocol
{
    var profileView: PresenterToViewProfileProtocol?
    
    var profileInteractor: PresenterToInteractorProfileProtocol?
    
    func showInfoAll() {
        profileInteractor?.showInfo()
    }
    
    func updateInfoAll(email: String, password: String) {
        profileInteractor?.updateInfo(email: email, password: password)
    }
    
    
}

extension ProfilePresenter : InteractorToPresenterProfileProtocol
{
    func sendDataToPresenter(email: String) {
        profileView?.sendDataToView(email: email)
    }
    
  
    
    
}
