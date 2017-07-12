//
//  ChooseCityInteractorInput.swift
//  OpenWeather
//
//  Created by Andrey Sidorovnin on 10.07.17.
//  Copyright © 2017 Dre. All rights reserved.
//

import Foundation

protocol ChooseCityInteractorInput: class {
    
    func obtainCityList(sortedByRegion: Region) -> [Region]
    func addNewCity(name: String)
    
}
