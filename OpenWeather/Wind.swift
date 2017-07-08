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
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        speed <- map["speed"]
        degree <- map["deg"]
    }
}
