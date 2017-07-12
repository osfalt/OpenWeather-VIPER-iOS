//
//  ChooseCityModulePopSegue.swift
//  OpenWeather
//
//  Created by Andrey Sidorovnin on 12.07.17.
//  Copyright © 2017 Dre. All rights reserved.
//

import UIKit

class ChooseCityModulePopSegue: UIStoryboardSegue {
    
    override func perform() {
        let chooseCityVC = source as! ChooseCityViewController
        chooseCityVC.navigationController?.popViewController(animated: true)
    }
}
