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
    static let apiKeyValue = "60b92c7c6653dc1bae7449f08d01f635"
    static let validStatusCodeRange = 200..<300
    static var defaultParams = [ApiConst.apiKeyParam: ApiConst.apiKeyValue, "lang": "ru", "units": "metric"]
}

class ApiUrl {
    
	static func full(path: String) -> String {
        return ApiEndpoint.host + path
        
//        if path.contains("?") {
//            return ApiEndpoint.host + path + "&appid=\(ApiConst.apiKey)"
//        } else {
//            return ApiEndpoint.host + path + "?appid=\(ApiConst.apiKey)"
//        }
    }
}
