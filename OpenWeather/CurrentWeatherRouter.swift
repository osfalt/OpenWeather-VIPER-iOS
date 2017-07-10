//
//  CurrentWeatherRouter.swift
//  OpenWeather
//
//  Created by Andrey Sidorovnin on 10.07.17.
//  Copyright © 2017 Dre. All rights reserved.
//

import Foundation
import ViperMcFlurry

/**
 Отвечает за навигацию между модулями.
 **/
class CurrentWeatherRouter: CurrentWeatherRouterInput {
    
//    weak var currentWeatherVC: CurrentWeatherViewController!
    var transitionHandler: RamblerViperModuleTransitionHandlerProtocol?
    
    func openChooseCityModule(withRegion region: Region) {
//        currentWeatherVC.region = region
//        currentWeatherVC.performSegue(withIdentifier: Constant.Segue.showChooseCityVC, sender: self)
        
//        transitionHandler?.openModule!(usingSegue: Constant.Segue.showChooseCityVC).thenChain({ (moduleInput) -> RamblerViperModuleOutput? in
//            moduleInput.
//        })
    }
    
    func closeCurrentModule() {
        print("closeCurrentModule()")
    }
    
}
