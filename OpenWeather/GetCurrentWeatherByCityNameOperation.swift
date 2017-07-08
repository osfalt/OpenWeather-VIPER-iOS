//
//  GetCurrentWeatherByCityNameOperation.swift
//  OpenWeather
//
//  Created by Dre on 08.07.17.
//  Copyright © 2017 Dre. All rights reserved.
//

import Foundation
import Alamofire

class GetCurrentWeatherByCityNameOperation: BaseApiOperation {
    
    private(set) var response: CurrentWeather?
    private var cityName: String
    
    required init(cityName: String) {
        self.cityName = cityName
    }
    
    override func main() {
        super.main()
        requestGetCurrentWeather()
    }
    
    private func requestGetCurrentWeather() {
        
        let request: DataRequest = alamofireManager.request(ApiUrl.full(path: "v1/resource/get/\(cityName)"))
        
        request.validate(statusCode: ApiConst.validStatusCodeRange)
            .responseObject { (response: DataResponse<CurrentWeather>) in
                
                self.responseHandler.handle(response: response, completion: { (apiResponse, error) in
                    if apiResponse != nil {
                        self.completeWith(response: apiResponse, error: nil)
                    } else {
                        self.completeWith(response: nil, error: error)
                    }
                })
        }
    }
    
    private func completeWith(response: CurrentWeather?, error: ApiError?) {
        self.isSuccess = (error == nil && response != nil)
        self.response = response
        self.error = error
        self.completeOperation()
    }
    
}
