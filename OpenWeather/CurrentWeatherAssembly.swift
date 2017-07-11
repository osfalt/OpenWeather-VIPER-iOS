//
//  CurrentWeatherAssembly.swift
//  OpenWeather
//
//  Created by Andrey Sidorovnin on 10.07.17.
//  Copyright © 2017 Dre. All rights reserved.
//

import Swinject
import SwinjectStoryboard

/**
 Отвечает за сборку данного модуля.
 **/
class CurrentWeatherAssembly: Assembly {
    
    private var container: Container!
    
    func assemble(container: Container) {
        self.container = container
        registerCurrentWeatherView()
        registerCurrentWeatherInteractor()
        registerCurrentWeatherPresenter()
        registerCurrentWeatherRouter()
    }
    
    private func registerCurrentWeatherView() {
        container.storyboardInitCompleted(CurrentWeatherViewController.self) { (resolver, controller) in
            controller.output = resolver.resolve(CurrentWeatherPresenter.self, argument: controller)
        }
    }
    
    private func registerCurrentWeatherInteractor() {
        container.register(CurrentWeatherInteractorInput.self) { (resolver, presenter: CurrentWeatherPresenter) in
            let interactor = CurrentWeatherInteractor()
            interactor.output = presenter
            interactor.currentWeatherService = resolver.resolve(CurrentWeatherService.self)
            return interactor
        }
    }
    
    private func registerCurrentWeatherPresenter() {
        container.register(CurrentWeatherPresenter.self) { (resolver, controller: CurrentWeatherViewController) in
            let presenter = CurrentWeatherPresenter()
            presenter.interactor = resolver.resolve(CurrentWeatherInteractorInput.self, argument: presenter)
            presenter.router = resolver.resolve(CurrentWeatherRouter.self, argument: controller)
            presenter.view = controller
            return presenter
        }
    }
    
    private func registerCurrentWeatherRouter() {
        container.register(CurrentWeatherRouter.self) { (resolver, controller: CurrentWeatherViewController) in
            let router = CurrentWeatherRouter()
            router.transitionHandler = controller
            return router
        }
    }
}
