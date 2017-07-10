//
//  CurrentWeatherInteractorOutput.swift
//  OpenWeather
//
//  Created by Andrey Sidorovnin on 10.07.17.
//  Copyright © 2017 Dre. All rights reserved.
//

import Foundation

/**
 Содержит методы, при помощи которых интерактор общается с вышестоящим слоем модуля. Этим протоколом обычно закрыт презентер.
 **/
protocol CurrentWeatherInteractorOutput: class {
    
    func willLoadCurrentWeather()
    func didLoadCurrentWeather(_ currentWeather: CurrentWeather)
    
}
