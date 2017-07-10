//
//  ChooseCityAssembly.swift
//  OpenWeather
//
//  Created by Andrey Sidorovnin on 10.07.17.
//  Copyright © 2017 Dre. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard {
    
    class func setupChooseCityAssembly() {
        let chooseCityAssembly = ChooseCityAssembly(container: container)
        chooseCityAssembly.setup()
    }
}

/**
 Отвечает за сборку данного модуля.
 **/
class ChooseCityAssembly {
    
    private let container: Container
    private weak var chooseCityVC: ChooseCityViewController!
    
    init(container: Container) {
        self.container = container
    }
    
    func setup() {
        registerChooseCityView()
        registerChooseCityInteractor()
        registerChooseCityPresenter()
        registerChooseCityRouter()
    }
    
    private func registerChooseCityView() {
        container.storyboardInitCompleted(ChooseCityViewController.self) { (resolver, controller) in
            self.chooseCityVC = controller
            controller.output = resolver.resolve(ChooseCityViewOutput.self)
        }
    }
    
    private func registerChooseCityInteractor() {
        container.register(ChooseCityInteractorInput.self) { _ in ChooseCityInteractor() }
            .initCompleted { (resolver, interactor) in
                let interactor = interactor as! ChooseCityInteractor
                interactor.output = resolver.resolve(ChooseCityInteractorOutput.self)
        }
    }
    
    private func registerChooseCityPresenter() {
        container.register(ChooseCityViewOutput.self) { (resolver) -> ChooseCityViewOutput in
            resolver.resolve(ChooseCityPresenter.self)!
        }
        
        container.register(ChooseCityInteractorOutput.self) { (resolver) -> ChooseCityInteractorOutput in
            resolver.resolve(ChooseCityPresenter.self)!
        }
        
        container.register(ChooseCityPresenter.self) { (resolver) -> ChooseCityPresenter in
            let presenter = ChooseCityPresenter()
            presenter.interactor = resolver.resolve(ChooseCityInteractorInput.self)!
            presenter.router = resolver.resolve(ChooseCityRouter.self)!
            presenter.view = self.chooseCityVC
            return presenter
        }
    }
    
    private func registerChooseCityRouter() {
        container.register(ChooseCityRouter.self) { (resolver) -> ChooseCityRouter in
            let router = ChooseCityRouter()
            return router
        }
    }
}
