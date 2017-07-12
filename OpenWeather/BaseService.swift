//
//  BaseService.swift
//  OpenWeather
//
//  Created by Dre on 08.07.17.
//  Copyright © 2017 Dre. All rights reserved.
//

import UIKit

enum ServiceError: Error {
    case methodNotImplemented
}

class BaseService {
    
    private var appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func addOperationToQueue(_ operation: Operation) {
        appDelegate.operationQueue.addOperation(operation)
    }
    
}
