//
//  CurrentWeatherServiceImpl.swift
//  OpenWeather
//
//  Created by Dre on 08.07.17.
//  Copyright © 2017 Dre. All rights reserved.
//

import Foundation

class CurrentWeatherServiceImpl: BaseService, CurrentWeatherService {
    
    func getCurrentWeather(byCityName cityName: String,
                           completion: ((_ currentWeather: CurrentWeather?, _ error: ApiError?) -> Void)?) {
        
        var operation: GetCurrentWeatherByCityNameOperation? = GetCurrentWeatherByCityNameOperation(cityName: cityName)
        operation!.completionBlock = {
            DispatchQueue.main.async {
                completion?(operation!.response, operation!.error)
                operation = nil
            }
        }
        
        addOperationToQueue(operation!)
    }
    
    func getCurrentWeather(byCityID: String,
                           completion: ((_ currentWeather: CurrentWeather?, _ error: ApiError?) -> Void)?) throws {
        
        throw ServiceError.methodNotImplemented
    }
}
