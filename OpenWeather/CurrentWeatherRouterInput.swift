//
//  CurrentWeatherRouterInput.swift
//  OpenWeather
//
//  Created by Andrey Sidorovnin on 10.07.17.
//  Copyright © 2017 Dre. All rights reserved.
//

import Foundation

/**
 Содержит методы переходов на другие модули, которые могут быть вызваны презентером.
 **/
protocol CurrentWeatherRouterInput: class {
    
    func openChooseCityModule()
    func closeCurrentModule()
    
}
