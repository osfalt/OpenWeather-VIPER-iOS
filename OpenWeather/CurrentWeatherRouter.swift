//
//  CurrentWeatherRouter.swift
//  OpenWeather
//
//  Created by Andrey Sidorovnin on 10.07.17.
//  Copyright © 2017 Dre. All rights reserved.
//

import Foundation

/**
 Отвечает за навигацию между модулями.
 **/
class CurrentWeatherRouter: CurrentWeatherRouterInput {
    
    weak var currentWeatherVC: CurrentWeatherViewController!
    
    func openChooseCityModule(withRegion region: Region) {
        currentWeatherVC.region = region
        currentWeatherVC.performSegue(withIdentifier: Constant.Segue.showChooseCityVC, sender: self)
    }
    
    func closeCurrentModule() {
        print("closeCurrentModule()")
    }
    
}
