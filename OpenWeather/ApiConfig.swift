//
//  ApiConfig.swift
//  OpenWeather
//
//  Created by Dre on 08.07.17.
//  Copyright © 2017 Dre. All rights reserved.
//

import Foundation

struct ApiEndpoint {
    static let host = "http://api.openweathermap.org/data/2.5/"
}

struct ApiConst {
    static let apiKeyParam = "appId"
    static let apiKey = "60b92c7c6653dc1bae7449f08d01f635"
    static let validStatusCodeRange = 200..<300
}

class ApiUrl {
    
    static func full(path: String) -> String {
        return ApiEndpoint.host + path
    }
}
