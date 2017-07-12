//
//  CurrentWeatherRouter.swift
//  OpenWeather
//
//  Created by Andrey Sidorovnin on 10.07.17.
//  Copyright © 2017 Dre. All rights reserved.
//

import Foundation
import LightRoute

/**
 Отвечает за навигацию между модулями.
 **/
class CurrentWeatherRouter: CurrentWeatherRouterInput {
    
    struct SegueId {
        static let chooseCityModule = "chooseCityModuleSegue"
    }
    
    weak var transitionHandler: TransitionHandler!
    
    func openChooseCityModule(withRegion region: Region) {
        transitionHandler.forSegue(identifier: SegueId.chooseCityModule, to: ChooseCityModuleInput.self) { (chooseCityModuleInput) in
            chooseCityModuleInput.configureCurrentModule(withRegion: region)
        }
    }
    
    func closeCurrentModule() {
        print("closeCurrentModule()")
    }
    
}
