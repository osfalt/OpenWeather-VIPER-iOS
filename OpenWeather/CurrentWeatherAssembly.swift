//
//  CurrentWeatherAssembly.swift
//  OpenWeather
//
//  Created by Andrey Sidorovnin on 10.07.17.
//  Copyright © 2017 Dre. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard {
    
    class func setupCurrentWeatherAssembly() {
        let currentWeatherAssembly = CurrentWeatherAssembly(container: container)
        currentWeatherAssembly.setup()
    }
}

class CurrentWeatherAssembly {
    
    private let container: Container
    private weak var currentWeatherVC: CurrentWeatherViewController!
    
    init(container: Container) {
        self.container = container
    }
    
    func setup() {
        registerCurrentWeatherView()
        registerCurrentWeatherInteractor()
        registerCurrentWeatherPresenter()
        registerCurrentWeatherRouter()
    }
    
    private func registerCurrentWeatherView() {

    }
    
    private func registerCurrentWeatherInteractor() {

    }
    
    private func registerCurrentWeatherPresenter() {

    }
    
    private func registerCurrentWeatherRouter() {

    }
}
