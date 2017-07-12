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
    
    var output: ChooseCityViewOutput!
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
    
    func updateView(withRegions regions: [Region]) {
        dataDisplayManager.configureDataDisplayManager(withRegions: regions)
        tableView.reloadData()
    }
    
    // MARK: - Actions
    
    @IBAction func actionDidTapAddCityButton(_ sender: UIButton) {
        if !cityTextField.text!.isEmpty {
            output.didTapAddCityButton(withCityName: cityTextField.text!)
            cityTextField.text = ""
        }
    }
}

// MARK: - ChooseCityDataDisplayManagerDelegate

extension ChooseCityViewController: ChooseCityDataDisplayManagerDelegate {
    
    func didTapCityCell(withRegion region: Region) {
        output.didTapCityCell(withRegion: region)
    }

}
