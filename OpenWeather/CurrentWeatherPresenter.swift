//
//  CurrentWeatherPresenter.swift
//  OpenWeather
//
//  Created by Andrey Sidorovnin on 10.07.17.
//  Copyright © 2017 Dre. All rights reserved.
//

import Foundation

/**
 Получает от View информацию о действиях пользователя и преображает ее в запросы к Роутеру, Интерактору, а также получает данные от Интерактора, подготавливает их и отправляет View для отображения.
 **/
class CurrentWeatherPresenter: NSObject, CurrentWeatherModuleInput, CurrentWeatherInteractorOutput, CurrentWeatherViewOutput {

    weak var view: CurrentWeatherViewInput!
    var router: CurrentWeatherRouterInput!
    var interactor: CurrentWeatherInteractorInput!
    
    // MARK: - CurrentWeatherModuleInput
    
    func configureCurrentModule(withRegion region: Region) {
        view.setupRegionView(withRegion: region)
    }
    
    // MARK: - CurrentWeatherInteractorOutput
    
    func willLoadCurrentWeather() {
        view.showLoadingIndicator()
    }
    
    func didLoadCurrentWeatherWithSuccess(_ currentWeather: CurrentWeather) {
        view.hideLoadingIndicator()
        view.setupView(withCurrentWeather: currentWeather)
    }

    func didLoadCurrentWeatherWithError(_ error: ApiError) {
        view.hideLoadingIndicator()
        view.showError(error)
    }
    
    // MARK: - CurrentWeatherViewOutput
    
    func didRefreshWeather() {
        interactor.obtainCurrentWeather(byCityName: "Уральск")
    }
    
    func didTapRegionItem() {
        router.openChooseCityModule(withRegion: Region(id: 0, localizedCityName: "Москва", cityName: "Moscow", regionCode: "RU"))
    }
}
