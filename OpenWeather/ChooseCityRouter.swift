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
    
    var transitionHandler: TransitionHandler?
    
    func closeCurrentModule(withRegion region: Region) {
        print("closeCurrentModule withRegion: \(region)")
    }
    
}
