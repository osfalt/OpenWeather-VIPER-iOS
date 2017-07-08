//
//  ApiError.swift
//  OpenWeather
//
//  Created by Dre on 08.07.17.
//  Copyright © 2017 Dre. All rights reserved.
//

import Foundation

enum ApiError: Error {
    case unauthorized
    case notFound
    case serverError
    case serviceUnavailable
    case unknown
}

extension ApiError: LocalizedError {
    
    var localizedDescription: String {
        switch self {
        case .unauthorized:
            return "Ошибка авторизации"
        case .notFound:
            return "Ресурс не найден"
        case .serverError:
            return "Внутренняя ошибка сервера"
        case .serviceUnavailable:
            return "Сервис временно недоступен"
        case .unknown:
            return "Неизвестная ошибка"
        }
    }
}
