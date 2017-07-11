//
//  ChooseCityAssembly.swift
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
class ChooseCityAssembly: Assembly {
    
    private var container: Container!
    
    func assemble(container: Container) {
        self.container = container
        registerChooseCityView()
        registerChooseCityInteractor()
        registerChooseCityPresenter()
        registerChooseCityRouter()
    }
    
    private func registerChooseCityView() {
        container.storyboardInitCompleted(ChooseCityViewController.self) { (resolver, controller) in
            controller.output = resolver.resolve(ChooseCityPresenter.self, argument: controller)
        }
    }
    
    private func registerChooseCityInteractor() {
        container.register(ChooseCityInteractorInput.self) { (resolver, presenter: ChooseCityPresenter) in
            let interactor = ChooseCityInteractor()
            interactor.output = presenter
            return interactor
        }
    }
    
    private func registerChooseCityPresenter() {
        container.register(ChooseCityPresenter.self) { (resolver, controller: ChooseCityViewController) in
            let presenter = ChooseCityPresenter()
            presenter.interactor = resolver.resolve(ChooseCityInteractorInput.self, argument: presenter)
            presenter.router = resolver.resolve(ChooseCityRouter.self, argument: controller)
            presenter.view = controller
            return presenter
        }
    }
    
    private func registerChooseCityRouter() {
        container.register(ChooseCityRouter.self) { (resolver, controller: ChooseCityViewController) in
            let router = ChooseCityRouter()
            router.transitionHandler = controller
            return router
        }
    }
}
