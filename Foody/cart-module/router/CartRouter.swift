//
//  CartRouter.swift
//  Foody
//
//  Created by Bilge Çakar on 30.03.2022.
//

import Foundation

class CartRouter : PresenterToRouterCartProtocol
{
    static func createModule(ref: CartViewController) {
        
        let presenter = CartPresenter()
        
        
        ref.cartPresenterObject = presenter
        
        ref.cartPresenterObject?.cartInteractor = CartInteractor()
        
        ref.cartPresenterObject?.cartView = ref
      
        
        ref.cartPresenterObject?.cartInteractor?.cartPresenter = presenter
        
    }
    
    
}
