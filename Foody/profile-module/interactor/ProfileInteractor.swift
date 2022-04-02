//
//  ProfileInteractor.swift
//  Foody
//
//  Created by Bilge Çakar on 2.04.2022.
//

import Foundation
import Firebase

class ProfileInteractor : PresenterToInteractorProfileProtocol
{
    var profilePresenter: InteractorToPresenterProfileProtocol?
    
    func showInfo() {
        let auth = Auth.auth()
        
        let email = (auth.currentUser?.email)!
      
        profilePresenter?.sendDataToPresenter(email: email)
    }
    
    func updateInfo(email: String, password: String) {
        print("Soon...")
    }
        
}
