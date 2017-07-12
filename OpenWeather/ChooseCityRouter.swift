//
//  ChooseCityRouter.swift
//  OpenWeather
//
//  Created by Andrey Sidorovnin on 10.07.17.
//  Copyright © 2017 Dre. All rights reserved.
//

import Foundation
import LightRoute

class ChooseCityRouter: ChooseCityRouterInput {
    
    struct SegueId {
        static let chooseCityModulePop = "chooseCityModulePopSegue"
    }
    
    weak var transitionHandler: TransitionHandler!
    
    func closeCurrentModule(withRegion region: Region) {
        transitionHandler.forSegue(identifier: SegueId.chooseCityModulePop, to: CurrentWeatherModuleInput.self) { (currentWeatherModuleInput) in
            currentWeatherModuleInput.configureCurrentModule(withRegion: region)
        }
    }
    
}
