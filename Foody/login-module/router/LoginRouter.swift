//
//  LoginRouter.swift
//  Foody
//
//  Created by Bilge Çakar on 1.04.2022.
//

import Foundation

class LoginRouter : PresenterToRouter
{
    static func createModule(ref: ViewController) {
        ref.loginPresenterObject = LoginPresenter()
        ref.loginPresenterObject?.loginInteractor = LoginInteractor()
    }
    
    
}
