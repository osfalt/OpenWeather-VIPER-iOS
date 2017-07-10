//
//  CurrentWeather.swift
//  OpenWeather
//
//  Created by Dre on 08.07.17.
//  Copyright © 2017 Dre. All rights reserved.
//

import ObjectMapper

struct CurrentWeather: Mappable {
    
    var description: String? {
        didSet {
            description = description?.capitalized
        }
    }
    var iconID: String?
    var temperature = 0.0
    var temperatureMin = 0.0
    var temperatureMax = 0.0
    var wind: Wind?
    var pressure = 0 {
        didSet {
            pressure = Int(Double(pressure) * 0.75006375541921)
        }
    }
    var humidity = 0
    var sunrise: Date?
    var sunset: Date?
    var countryCode: String?
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        description <- map["weather.0.description"]
        iconID <- map["weather.0.icon"]
        temperature <- map["main.temp"]
        temperatureMin <- map["main.temp_min"]
        temperatureMax <- map["main.temp_max"]
        wind <- map["wind"]
        pressure <- map["main.pressure"]
        humidity <- map["main.humidity"]
        sunrise <- (map["sys.sunrise"], DateTransform())
        sunset <- (map["sys.sunset"], DateTransform())
        countryCode <- map["sys.country"]
    }
}
