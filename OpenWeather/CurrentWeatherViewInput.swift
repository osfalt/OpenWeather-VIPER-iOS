//
//  CurrentWeatherViewInput.swift
//  OpenWeather
//
//  Created by Andrey Sidorovnin on 10.07.17.
//  Copyright © 2017 Dre. All rights reserved.
//

import Foundation

/**
 Содержит методы, при помощи которых презентер может управлять отображением или получать введенные пользователем данные.
 **/
protocol CurrentWeatherViewInput: class {
    
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func setupView(withCurrentWeather: CurrentWeather)
    
}
