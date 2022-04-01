//
//  RegisterRouter.swift
//  Foody
//
//  Created by Bilge Çakar on 31.03.2022.
//

import Foundation

class RegisterRouter : PresenterToRouterRegisterProtocol
{
    static func createModule(ref: RegisterViewController) {
        ref.registerRresneterObject = RegisterPresenter()
        ref.registerRresneterObject?.registerInteractor = RegisterInteractor()
    }
        
}

