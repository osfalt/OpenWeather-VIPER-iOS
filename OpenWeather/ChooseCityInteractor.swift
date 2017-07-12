//
//  ChooseCityInteractor.swift
//  OpenWeather
//
//  Created by Andrey Sidorovnin on 10.07.17.
//  Copyright © 2017 Dre. All rights reserved.
//

import Foundation

class ChooseCityInteractor: ChooseCityInteractorInput {
    
    weak var output: ChooseCityInteractorOutput!
    
    private var regions = [Region(id: 0, cityName: "Москва", regionCode: "RU"),
                           Region(id: 1, cityName: "Санкт-Петербург", regionCode: "RU"),
                           Region(id: 2, cityName: "Обнинск", regionCode: "RU")]
    
    // MARK: - ChooseCityInteractorInput
    
    func obtainCityList(sortedByRegion region: Region) -> [Region] {
        regions.sort { (region1, region2) -> Bool in
            return region1.cityName! < region2.cityName!
        }
        return regions
    }
    
    func addNewCity(name: String) {
        regions.append(Region(id: 0, cityName: name, regionCode: ""))
        output.didAddedNewCity()
    }
}
