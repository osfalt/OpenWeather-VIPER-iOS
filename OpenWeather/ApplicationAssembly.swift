//
//  ApplicationAssembly.swift
//  OpenWeather
//
//  Created by Andrey Sidorovnin on 11.07.17.
//  Copyright © 2017 Dre. All rights reserved.
//

import Swinject
import SwinjectStoryboard

class ApplicationAssembly {
    
    static let assembler = try! Assembler(assemblies: [
            CurrentWeatherAssembly(),
            ChooseCityAssembly()
        ])
    
}

extension SwinjectStoryboard {
    
    static func setup() {
        defaultContainer = ApplicationAssembly.assembler.resolver as! Container
        registerServices()
    }
    
    private class func registerServices() {
        // CurrentWeatherService
        defaultContainer.register(CurrentWeatherService.self) { resolver in
            CurrentWeatherServiceImpl()
        }
    }
}
