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
    
    weak var transitionHandler: TransitionHandler!
    
    func closeCurrentModule(withRegion region: Region) {
        guard let navigationController = (transitionHandler as! ChooseCityViewController).navigationController else { return }
        navigationController.popViewController(animated: true)
        
        guard let currentWeatherViewController = navigationController.topViewController as? CurrentWeatherViewController else { return }
        (currentWeatherViewController.output as! CurrentWeatherPresenter).configureCurrentModule(withRegion: region)
    }
    
}
