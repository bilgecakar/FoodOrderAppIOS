//
//  HomeRouter.swift
//  Foody
//
//  Created by Bilge Çakar on 28.03.2022.
//

import Foundation

class HomeRouter : PresenterToRouterHomePageProtocol
{
    static func createModule(ref: HomePageViewController) {
        
        let pressenter = HomePresenter()
        ref.homepagePresenterOnject = pressenter
        ref.homepagePresenterOnject?.homepageInteractor = HomeInteractor()
        ref.homepagePresenterOnject?.homepageView = ref
        ref.homepagePresenterOnject?.homepageInteractor?.homepagePresenter = pressenter
    }
}
