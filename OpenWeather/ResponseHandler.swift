//
//  ResponseHandler.swift
//  OpenWeather
//
//  Created by Dre on 08.07.17.
//  Copyright © 2017 Dre. All rights reserved.
//

import Foundation
import Alamofire

class ResponseHandler {
    
    func handle<T>(response: DataResponse<T>, completion: (_ response: T?, _ error: ApiError?) -> Void) {
        switch response.result {
        case .success(let value):
            completion(value, nil)
            break
        case .failure(_):
            completion(nil, parseError(fromResponse: response))
            break
        }
    }
    
    private func parseError<T>(fromResponse response: DataResponse<T>) -> ApiError {
        guard let statusCode = response.response?.statusCode else { return ApiError.unknown }
        
        switch statusCode {
        case 401:
            return ApiError.unauthorized
        case 404:
            return ApiError.notFound
        case 500:
            return ApiError.serverError
        case 503:
            return ApiError.serviceUnavailable
        default:
            return ApiError.unknown
        }
    }
}
