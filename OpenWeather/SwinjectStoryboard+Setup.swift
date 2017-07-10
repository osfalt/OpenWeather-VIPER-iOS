//
//  SwinjectStoryboard+Setup.swift
//  OpenWeather
//
//  Created by Andrey Sidorovnin on 10.07.17.
//  Copyright © 2017 Dre. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard {
    
    static var container: Container {
        return defaultContainer
    }
    
    static func setup() {
        // сборка VIPER-модулей
        setupCurrentWeatherAssembly()
    }
    
}
