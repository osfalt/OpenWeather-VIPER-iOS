//
//  CurrentWeatherServiceTests.swift
//  OpenWeather
//
//  Created by Andrey Sidorovnin on 12.07.17.
//  Copyright © 2017 Dre. All rights reserved.
//

import XCTest
@testable import OpenWeather

class CurrentWeatherServiceTests: XCTestCase {

    private var service: CurrentWeatherService!
    private let defaultTimeout: TimeInterval = 15
    
    override func setUp() {
        super.setUp()
        
        service = CurrentWeatherServiceImpl()
    }
    
    func testGetCurrentWeatherByCityName() {
        let cityName = "Москва"
        
        let loadingExpectation = expectation(description: "Текущая погода загружена")
        
        service.getCurrentWeather(byCityName: cityName) { [weak self] (currentWeather, error) in
            guard let sself = self else { return }
            
            if error == nil {
                if let currentWeather = currentWeather {
                    sself.validate(currentWeather: currentWeather)
                } else {
                    XCTAssertNotNil(currentWeather, "currentWeather не должна быть nil, когда нет ошибки в ответе")
                }
            } else {
                XCTAssert(!error!.localizedDescription.isEmpty, "Текст ошибки не должен быть пустым")
            }
            
            loadingExpectation.fulfill()
        }
        
        waitForExpectations(timeout: defaultTimeout)
    }
    
    private func validate(currentWeather: CurrentWeather) {
        XCTAssertNotNil(currentWeather.countryCode)
        XCTAssertNotNil(currentWeather.description)
        XCTAssertNotNil(currentWeather.iconID)
        XCTAssertNotNil(currentWeather.sunrise)
        XCTAssertNotNil(currentWeather.sunset)
        XCTAssertNotNil(currentWeather.wind)
        
        XCTAssertNotEqual(currentWeather.humidity, 0)
        XCTAssertNotEqual(currentWeather.pressure, 0)
    }
}
