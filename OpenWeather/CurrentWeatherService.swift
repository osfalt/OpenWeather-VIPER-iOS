//
//  CurrentWeatherService.swift
//  OpenWeather
//
//  Created by Dre on 08.07.17.
//  Copyright © 2017 Dre. All rights reserved.
//

import Foundation

protocol CurrentWeatherService {
    
    func getCurrentWeather(byCityName: String,
                           completion: ((_ currentWeather: CurrentWeather?, _ error: ApiError?) -> Void)?)
    
    func getCurrentWeather(byCityID: String,
                           completion: ((_ currentWeather: CurrentWeather?, _ error: ApiError?) -> Void)?) throws
    
}
