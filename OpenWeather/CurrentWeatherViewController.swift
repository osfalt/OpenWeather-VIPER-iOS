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
//    var region: Region?
    
    // MARK: - Ovverides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDateFormatter()
        setupRefreshControl()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.didRefreshWeather()
    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        super.prepare(for: segue, sender: sender)
//        
//        if segue.identifier == Constant.Segue.showChooseCityVC {
//            let chooseCityVC = segue.destination as! ChooseCityViewController
//            chooseCityVC.region = region
//        }
//    }
    
    // MARK: - Setup Components
    
    private func setupDateFormatter() {
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
    }
    
    private func setupRefreshControl() {
        scrollView.alwaysBounceVertical = true
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(actionRefreshWeather), for: .valueChanged)
        scrollView.addSubview(refreshControl)
    }
    
    // MARK: - Actions
    
    @objc private func actionRefreshWeather() {
        output.didRefreshWeather()
    }
    
    @IBAction func actionDidTapRegionItem(_ sender: UITapGestureRecognizer) {
        output.didTapRegionItem()
    }
    
    // MARK: - CurrentWeatherViewInput
    
    func showLoadingIndicator() {
        windArrowImageView.transform = CGAffineTransform.identity
    }
    
    func hideLoadingIndicator() {
        refreshControl.endRefreshing()
    }
    
    func setupRegionView(withRegion region: Region) {
        regionLabel.text = region.cityName
    }
    
    func setupView(withCurrentWeather weather: CurrentWeather) {
        flagImageView.image = UIImage(named: weather.countryCode?.lowercased() ?? "")
        temperatureLabel.text = "\(String(format: "%.0f", weather.temperature)) ℃"
        weatherImageView.image = UIImage(named: weather.iconID!)
        weatherLabel.text = "\(weather.description!)"
        windLabel.text = "\(weather.wind!.speed) м/c, \(weather.wind!.direction)"
        pressureLabel.text = "\(weather.pressure) мм рт.ст."
        humidityLabel.text = "\(weather.humidity) %"
        sunriseTimeLabel.text = "\(dateFormatter.string(from: weather.sunrise!))"
        sunsetTimeLabel.text = "\(dateFormatter.string(from: weather.sunset!))"
        
        // wind direction
        let radians = (CGFloat(weather.wind!.degree - 180) * CGFloat.pi) / 180
        let rotatedTransform = self.windArrowImageView.transform.rotated(by: radians)
        UIView.animate(withDuration: 1.2, delay: 0, options: [.curveEaseOut], animations: {
            self.windArrowImageView.transform = rotatedTransform
        })
    }
    
    func showError(_ error: ApiError) {
        showErrorBanner(message: error.localizedDescription, position: .top)
    }
}
