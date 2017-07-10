//
//  ChooseCityRouter.swift
//  OpenWeather
//
//  Created by Andrey Sidorovnin on 10.07.17.
//  Copyright © 2017 Dre. All rights reserved.
//

import Foundation
import ViperMcFlurry

class ChooseCityRouter: ChooseCityRouterInput {
    
    var transitionHandler: RamblerViperModuleTransitionHandlerProtocol?
    
    func openCurrentWeatherModule(withRegion: Region) {
        
    }
    
    func closeCurrentModule() {
        print("closeCurrentModule()")
    }
    
}
