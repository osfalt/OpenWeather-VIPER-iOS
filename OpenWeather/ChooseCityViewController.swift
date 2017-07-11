//
//  ChooseCityViewController.swift
//  OpenWeather
//
//  Created by Dre on 09.07.17.
//  Copyright © 2017 Dre. All rights reserved.
//

import UIKit

class ChooseCityViewController: UIViewController, ChooseCityViewInput {

    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var cities = [Region]()
    dynamic var output: ChooseCityViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    // MARK: - Actions
    
    @IBAction func actionDidTapAddCityButton(_ sender: UIButton) {
        if !cityTextField.text!.isEmpty {
            cities.append(Region(id: 0, cityName: cityTextField.text!, regionCode: ""))
            output.didTapAddCityButton(withCityName: cityTextField.text!)
            cityTextField.text = ""
            tableView.reloadData()
        }
    }
    
    // MARK: - ChooseCityViewInput
    
    func showRegionInTextField(_ region: Region) {
        cityTextField.text = region.cityName!
        cities.append(region)
    }
}

extension ChooseCityViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.CellIdentifier.cityCell, for: indexPath)
        cell.textLabel?.text = cities[indexPath.row].cityName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.popViewController(animated: true)
    }
}
