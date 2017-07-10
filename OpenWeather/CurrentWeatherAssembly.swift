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

/**
 Отвечает за сборку данного модуля.
 **/
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
        container.storyboardInitCompleted(CurrentWeatherViewController.self) { (resolver, controller) in
            self.currentWeatherVC = controller
            controller.output = resolver.resolve(CurrentWeatherViewOutput.self)
        }
    }
    
    private func registerCurrentWeatherInteractor() {
        container.register(CurrentWeatherInteractorInput.self) { _ in CurrentWeatherInteractor() }
            .initCompleted { (resolver, interactor) in
                let interactor = interactor as! CurrentWeatherInteractor
                interactor.output = resolver.resolve(CurrentWeatherInteractorOutput.self)
                interactor.currentWeatherService = resolver.resolve(CurrentWeatherService.self)
        }
    }
    
    private func registerCurrentWeatherPresenter() {
        container.register(CurrentWeatherViewOutput.self) { (resolver) -> CurrentWeatherViewOutput in
            resolver.resolve(CurrentWeatherPresenter.self)!
        }
        
        container.register(CurrentWeatherInteractorOutput.self) { (resolver) -> CurrentWeatherInteractorOutput in
            resolver.resolve(CurrentWeatherPresenter.self)!
        }
        
        container.register(CurrentWeatherPresenter.self) { (resolver) -> CurrentWeatherPresenter in
            let presenter = CurrentWeatherPresenter()
            presenter.interactor = resolver.resolve(CurrentWeatherInteractorInput.self)!
            presenter.router = resolver.resolve(CurrentWeatherRouter.self)!
            presenter.view = self.currentWeatherVC
            return presenter
        }
    }
    
    private func registerCurrentWeatherRouter() {
        container.register(CurrentWeatherRouter.self) { (resolver) -> CurrentWeatherRouter in
            let router = CurrentWeatherRouter()
            router.transitionHandler = self.currentWeatherVC
            return router
        }
    }
}
