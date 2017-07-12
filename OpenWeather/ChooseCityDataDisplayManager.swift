//
//  ChooseCityDataDisplayManager.swift
//  OpenWeather
//
//  Created by Andrey Sidorovnin on 12.07.17.
//  Copyright © 2017 Dre. All rights reserved.
//

import UIKit

// MARK: - ChooseCityDataDisplayManagerDelegate

protocol ChooseCityDataDisplayManagerDelegate: class {
    
    func didTapCityCell(withRegion: Region)
    
}

// MARK: - ChooseCityDataDisplayManager

class ChooseCityDataDisplayManager: NSObject, DataDisplayManager {
    
    weak var delegate: ChooseCityDataDisplayManagerDelegate?
    private var tableViewDataSource: UITableViewDataSource?
    private var tableViewDelegate: UITableViewDelegate?
    fileprivate var regions: [Region]!
    
    func configureDataDisplayManager(withRegions regions: [Region]) {
        self.regions = regions
    }
    
    // MARK: - DataDisplayManager
    
    func dataSource(forTableView tableView: UITableView) -> UITableViewDataSource {
        return self
    }
    
    func delegate(forTableView tableView: UITableView, withBaseDelegate baseDelegate: UITableViewDelegate? = nil) -> UITableViewDelegate {
        return self
    }
    
}

// MARK: - UITableViewDataSource

extension ChooseCityDataDisplayManager: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return regions.count
    }
    
}

// MARK: - UITableViewDelegate

extension ChooseCityDataDisplayManager: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.CellIdentifier.cityCell, for: indexPath)
        cell.textLabel?.text = regions[indexPath.row].cityName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.didTapCityCell(withRegion: regions[indexPath.row])
    }
    
}

