//
//  Wind.swift
//  OpenWeather
//
//  Created by Dre on 08.07.17.
//  Copyright © 2017 Dre. All rights reserved.
//

import ObjectMapper

struct Wind: Mappable {
    
    var speed = 0
    var degree = 0
    var direction: String {
        switch degree {
        case 0..<23:
            return "С"
        case 338..<360:
            return "С"
        case 23..<68:
            return "СВ"
        case 68..<113:
            return "В"
        case 113..<158:
            return "ЮВ"
        case 158..<203:
            return "Ю"
        case 203..<248:
            return "ЮЗ"
        case 248..<293:
            return "З"
        case 293..<338:
            return "СЗ"
        default:
            return ""
        }
    }
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        speed <- map["speed"]
        degree <- map["deg"]
    }
}
