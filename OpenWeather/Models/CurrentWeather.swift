//
//  CurrentWeather.swift
//  OpenWeather
//
//  Created by Dre on 08.07.17.
//  Copyright © 2017 Dre. All rights reserved.
//

import ObjectMapper

struct CurrentWeather: Mappable {
    
    var description: String?
    var iconID: String?
    var temperature: Double?
    var temperatureMin: Double?
    var temperatureMax: Double?
    var wind: Wind?
    var pressure: Int?
    var humidity: Int?
    var sunrise: Int?
    var sunset: Int?
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        description <- map["weather.description"]
        iconID <- map["weather.icon"]
        temperature <- map["main.temp"]
        temperatureMin <- map["main.temp_min"]
        temperatureMax <- map["main.temp_max"]
        wind <- map["wind"]
        pressure <- map["main.pressure"]
        humidity <- map["main.humidity"]
        sunrise <- map["sys.sunrise"]
        sunset <- map["sys.sunset"]
    }
}
