//
//  DataDisplayManager.swift
//  OpenWeather
//
//  Created by Andrey Sidorovnin on 12.07.17.
//  Copyright © 2017 Dre. All rights reserved.
//

import UIKit

protocol DataDisplayManager: class {
    
    func dataSource(forTableView tableView: UITableView) -> UITableViewDataSource
    
    func delegate(forTableView tableView: UITableView, withBaseDelegate baseDelegate: UITableViewDelegate?) -> UITableViewDelegate
    
}
