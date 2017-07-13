//
//  CurrentWeatherInteractor.swift
//  OpenWeather
//
//  Created by Andrey Sidorovnin on 10.07.17.
//  Copyright © 2017 Dre. All rights reserved.
//

import Foundation

/**
 Содержит всю бизнес-логику, необходимую для работы текущего модуля.
 **/
class CurrentWeatherInteractor: CurrentWeatherInteractorInput {
    
    weak var output: CurrentWeatherInteractorOutput!
    var currentWeatherService: CurrentWeatherService!
    
    private var cityName = "Москва"
    
    // MARK: - CurrentWeatherInteractorInput
    
    func updateCityName(_ cityName: String) {
        self.cityName = cityName
    }
    
    func obtainCurrentCityName() -> String {
        return cityName
    }
    
    func obtainCurrentWeather(byCityName cityName: String) {
        updateCityName(cityName)
        
        output.willLoadCurrentWeather()
        
        currentWeatherService.getCurrentWeather(byCityName: cityName) { [weak self] (weather, error) in
            guard let strongSelf = self else { return }
            
            if error == nil {
                guard let currentWeather = weather else { return }
                strongSelf.output.didLoadCurrentWeatherWithSuccess(currentWeather)
            } else {
                strongSelf.output.didLoadCurrentWeatherWithError(error!)
            }

        }
    }
}
