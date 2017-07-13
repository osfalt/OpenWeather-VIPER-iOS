//
//  ChooseCityPresenter.swift
//  OpenWeather
//
//  Created by Andrey Sidorovnin on 10.07.17.
//  Copyright © 2017 Dre. All rights reserved.
//

import Foundation

class ChooseCityPresenter: ChooseCityModuleInput, ChooseCityInteractorOutput, ChooseCityViewOutput {
    
    weak var view: ChooseCityViewInput!
    var router: ChooseCityRouterInput!
    var interactor: ChooseCityInteractorInput!
    
    private var region: Region!
    
    // MARK: - ChooseCityModuleInput
    
    func configureCurrentModule(withRegion region: Region) {
        self.region = region
    }
    
    // MARK: - ChooseCityInteractorOutput
    
    func didAddedNewCity() {
        view.updateView(withRegions: interactor.obtainCityList(sortedByRegion: region))
    }
    
    // MARK: - ChooseCityViewOutput
    
    func didTriggerViewDidLoadEvent() {
        view.configureView(withRegions: interactor.obtainCityList(sortedByRegion: region))
    }
    
    func didTapAddCityButton(withCityName cityName: String) {
        interactor.addNewCity(name: cityName)
    }
    
    func didTapCityCell(withRegion region: Region) {
        router.closeCurrentModule(withRegion: region)
    }
}
