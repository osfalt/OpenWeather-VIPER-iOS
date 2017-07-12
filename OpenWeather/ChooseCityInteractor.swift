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
    
    // MARK: - ChooseCityInteractorInput
    
    func obtainRegionList(sortedByRegion: Region) -> [Region] {
        return [Region(id: 0, cityName: "Москва", regionCode: "RU"),
                Region(id: 1, cityName: "Санкт-Петербург", regionCode: "RU")]
    }
}
