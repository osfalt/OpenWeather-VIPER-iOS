//
//  CurrentWeatherViewController.swift
//  OpenWeather
//
//  Created by Dre on 07.07.17.
//  Copyright © 2017 Dre. All rights reserved.
//

import UIKit

class CurrentWeatherViewController: UIViewController, CurrentWeatherViewInput {
    
    @IBOutlet weak var scrollView: UIScrollView!
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
    
    var refreshControl: UIRefreshControl!
    var output: CurrentWeatherViewOutput!
    
    private var dateFormatter: DateFormatter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        scrollView.alwaysBounceVertical = true
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(actionRefreshWeather), for: .valueChanged)
        scrollView.addSubview(refreshControl)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        requestGetWeather()
    }
    
    private func requestGetWeather() {
        windArrowImageView.transform = CGAffineTransform.identity
        
        let service = CurrentWeatherServiceImpl()
        service.getCurrentWeather(byCityName: "Moscow") { (weather, error) in
            
            if error == nil {
                guard let weather = weather else { return }
                
                self.temperatureLabel.text = "\(String(format: "%.0f", weather.temperature)) ℃"
                self.weatherLabel.text = "\(weather.description!)"
                self.windLabel.text = "\(weather.wind!.speed) м/c, \(weather.wind!.direction)"
                self.pressureLabel.text = "\(weather.pressure) мм рт.ст."
                self.humidityLabel.text = "\(weather.humidity) %"
                self.sunriseTimeLabel.text = "\(self.dateFormatter.string(from: weather.sunrise!))"
                self.sunsetTimeLabel.text = "\(self.dateFormatter.string(from: weather.sunset!))"
                
                // wind direction
                let radians = (CGFloat(weather.wind!.degree - 180) * CGFloat.pi) / 180
                let rotatedTransform = self.windArrowImageView.transform.rotated(by: radians)
                UIView.animate(withDuration: 1.2, delay: 0.2, options: [.curveEaseOut], animations: {
                    self.windArrowImageView.transform = rotatedTransform
                })
                
            } else {
                self.showErrorBanner(message: error!.localizedDescription, position: .top)
            }
            
            self.refreshControl.endRefreshing()
        }
    }

    // MARK: - Actions
    
    @objc private func actionRefreshWeather() {
        output.didRefreshWeather()
        
        requestGetWeather()
    }
    
    @IBAction func actionDidTapRegionItem(_ sender: UITapGestureRecognizer) {
        output.didTapRegionItem()
        
        performSegue(withIdentifier: Constant.Segue.showChooseCityVC, sender: self)
    }
    
    // MARK: - CurrentWeatherViewInput
    
    
    func showLoadingIndicator() {
        
    }
    
    func hideLoadingIndicator() {
        
    }
    
    func setupView(withCurrentWeather: CurrentWeather) {
        
    }
}
