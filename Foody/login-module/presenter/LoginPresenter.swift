//
//  LoginPresenter.swift
//  Foody
//
//  Created by Bilge Çakar on 1.04.2022.
//

import Foundation

class LoginPresenter : ViewToPresenterLoginProtocol
{
    var loginInteractor: PresenterToInteractorLoginProtocol?
    
    func loginAll(email: String, password: String) {
        loginInteractor?.login(email: email, password: password)
    }
    
    
    
    
}
