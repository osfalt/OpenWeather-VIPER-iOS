//
//  CurrentWeatherViewController.swift
//  OpenWeather
//
//  Created by Dre on 07.07.17.
//  Copyright © 2017 Dre. All rights reserved.
//

import UIKit

class CurrentWeatherViewController: UIViewController {
    
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var windArrowImageView: UIImageView!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var sunriseTimeLabel: UILabel!
    @IBOutlet weak var sunsetTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let service = CurrentWeatherServiceImpl()
        service.getCurrentWeather(byCityName: "Moscow") { (weather, error) in
            
            if error == nil {
                guard let weather = weather else { return }
                
                self.temperatureLabel.text = "\(weather.temperature!)"
                self.weatherLabel.text = "\(weather.description!)"
            } else {
                self.showErrorBanner(message: error!.localizedDescription, position: .top)
            }
        }
    }

}
