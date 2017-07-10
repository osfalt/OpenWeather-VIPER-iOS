//
//  CurrentWeatherViewOutput.swift
//  OpenWeather
//
//  Created by Andrey Sidorovnin on 10.07.17.
//  Copyright © 2017 Dre. All rights reserved.
//

import Foundation

/**
 Содержит методы, при помощи которых View уведомляет презентер об изменениях своего состояния.
 В этом же протоколе находятся и методы, при помощи которых View уведомляет презентер о событиях своего жизненного цикла.
 **/
protocol CurrentWeatherViewOutput: class {
 
//    func didTriggerViewDidLoadEvent()
    func didRefreshWeather()
    func didTapRegionItem()
    
}
