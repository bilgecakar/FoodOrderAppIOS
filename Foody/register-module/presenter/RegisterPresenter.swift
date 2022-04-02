//
//  RegisterPresenter.swift
//  Foody
//
//  Created by Bilge Çakar on 31.03.2022.
//

import Foundation

class RegisterPresenter : ViewToPresenterRegisterProtocol
{
    var registerInteractor: PresenterToInteractorRegisterProtocol?
    
    func registerAll(email: String, password: String) {
        registerInteractor?.register(email: email, password: password)
    }
    
}
