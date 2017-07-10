//
//  ChooseCityModuleInput.swift
//  OpenWeather
//
//  Created by Andrey Sidorovnin on 10.07.17.
//  Copyright © 2017 Dre. All rights reserved.
//

import Foundation
import ViperMcFlurry

protocol ChooseCityModuleInput: RamblerViperModuleInput {
    
    func configureCurrentModule(withRegion region: Region)
    
}
