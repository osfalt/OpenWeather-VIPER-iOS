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
class CurrentWeatherPresenter: CurrentWeatherInteractorOutput, CurrentWeatherViewOutput {

    weak var view: CurrentWeatherViewInput!
    var router: CurrentWeatherRouterInput!
    var interactor: CurrentWeatherInteractorInput!
    
    // MARK: - CurrentWeatherInteractorOutput
    

    func willLoadCurrentWeather() {
        view.showLoadingIndicator()
    }
    
    func didLoadCurrentWeather(_ currentWeather: CurrentWeather) {
        view.hideLoadingIndicator()
        view.setupView(withCurrentWeather: currentWeather)
    }

    // MARK: - CurrentWeatherViewOutput
    
    func didRefreshWeather() {
        interactor.obtainCurrentWeather()
    }
    
    func didTapRegionItem() {
        router.openChooseCityModule()
    }
}
