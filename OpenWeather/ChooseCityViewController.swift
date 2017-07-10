//
//  ChooseCityViewController.swift
//  OpenWeather
//
//  Created by Dre on 09.07.17.
//  Copyright © 2017 Dre. All rights reserved.
//

import UIKit

class ChooseCityViewController: UIViewController {

    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var region: Region!
    fileprivate var cities = [Region]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cities.append(region)
        tableView.dataSource = self
        tableView.delegate = self
    }

    // MARK: - IBActions
    
    @IBAction func actionDidTapAddCityButton(_ sender: UIButton) {
        if !cityTextField.text!.isEmpty {
            cities.append(Region(id: 0, localizedCityName: cityTextField.text!, cityName: "", regionCode: ""))
            cityTextField.text = ""
            tableView.reloadData()
        }
    }
}

extension ChooseCityViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.CellIdentifier.cityCell, for: indexPath)
        cell.textLabel?.text = cities[indexPath.row].localizedCityName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.popViewController(animated: true)
    }
}
