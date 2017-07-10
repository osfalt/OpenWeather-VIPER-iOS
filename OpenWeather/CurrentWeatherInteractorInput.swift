//
//  CurrentWeatherInteractorInput.swift
//  OpenWeather
//
//  Created by Andrey Sidorovnin on 10.07.17.
//  Copyright © 2017 Dre. All rights reserved.
//

import Foundation

/**
 Содержит методы для общения с интерактором. Этим протоколом закрыт интерактор с точки зрения презентера.
 **/
protocol CurrentWeatherInteractorInput: class {
    
    func obtainCurrentWeather()
    
}
