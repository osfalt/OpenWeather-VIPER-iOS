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
    
    struct SegueId {
        static let chooseCityModuleSegue = "chooseCityModuleSegue"
    }
    
    var transitionHandler: RamblerViperModuleTransitionHandlerProtocol!
    
    func openChooseCityModule(withRegion region: Region) {
        
        transitionHandler.openModule!(usingSegue: SegueId.chooseCityModuleSegue)
            .thenChain { (moduleInput) -> RamblerViperModuleOutput? in
                let chooseCityModuleInput = moduleInput as! ChooseCityModuleInput
                chooseCityModuleInput.configureCurrentModule(withRegion: region)
                return nil
            }
    }
    
    func closeCurrentModule() {
        print("closeCurrentModule()")
    }
    
}
