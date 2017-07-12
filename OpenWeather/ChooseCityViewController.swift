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
    
    dynamic var output: ChooseCityViewOutput!
    var dataDisplayManager: ChooseCityDataDisplayManager!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.didTriggerViewDidLoadEvent()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cityTextField.becomeFirstResponder()
    }

    // MARK: - ChooseCityViewInput
    
    func configureView(withRegions regions: [Region]) {
        dataDisplayManager.configureDataDisplayManager(withRegions: regions)
        dataDisplayManager.delegate = self
        
        tableView.dataSource = dataDisplayManager.dataSource(forTableView: tableView)
        tableView.delegate = dataDisplayManager.delegate(forTableView: tableView)
    }
    
    // MARK: - Actions
    
    @IBAction func actionDidTapAddCityButton(_ sender: UIButton) {
        if !cityTextField.text!.isEmpty {
//            cities.append(Region(id: 0, cityName: cityTextField.text!, regionCode: ""))
//            output.didTapAddCityButton(withCityName: cityTextField.text!)
//            cityTextField.text = ""
//            tableView.reloadData()
        }
    }
}

// MARK: - ChooseCityDataDisplayManagerDelegate

extension ChooseCityViewController: ChooseCityDataDisplayManagerDelegate {
    
    func didTapCityCell(withRegion region: Region) {
//        output.didTapCityCell(withRegion: region)
    }

}
