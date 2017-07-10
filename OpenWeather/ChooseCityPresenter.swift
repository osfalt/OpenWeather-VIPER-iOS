//
//  ChooseCityPresenter.swift
//  OpenWeather
//
//  Created by Andrey Sidorovnin on 10.07.17.
//  Copyright © 2017 Dre. All rights reserved.
//

import Foundation

class ChooseCityPresenter: NSObject, ChooseCityModuleInput, ChooseCityInteractorOutput, ChooseCityViewOutput {
    
    weak var view: ChooseCityViewInput!
    var router: ChooseCityRouterInput!
    var interactor: ChooseCityInteractorInput!
    
    // MARK: - ChooseCityModuleInput
    
    func configureCurrentModule(withRegion region: Region) {
        view.showRegionInTextField(region)
    }
    
    // MARK: - ChooseCityInteractorOutput
 
    
    
    // MARK: - ChooseCityViewOutput
    
    func didTapAddCityButton(withCityName: String) {
        
    }
    
}
