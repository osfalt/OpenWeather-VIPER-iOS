//
//  ChooseCityModuleInput.swift
//  OpenWeather
//
//  Created by Andrey Sidorovnin on 10.07.17.
//  Copyright © 2017 Dre. All rights reserved.
//

import Foundation

protocol ChooseCityModuleInput: class {
    
    func configureCurrentModule(withRegion region: Region)
    
}
