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
    
    // MARK: - CurrentWeatherInteractorInput
    
    func obtainCurrentWeather() {
        currentWeatherService.getCurrentWeather(byCityName: "Moscow") { [weak self] (weather, error) in
            guard let strongSelf = self else { return }
            
            if error == nil {
                guard let weather = weather else { return }
                strongSelf.output.didLoadCurrentWeather(weather)
            } else {
                
            }

        }
    }
}
