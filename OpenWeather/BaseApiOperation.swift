//
//  BaseApiOperation.swift
//  OpenWeather
//
//  Created by Dre on 08.07.17.
//  Copyright © 2017 Dre. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import Reqres

class BaseApiOperation: Operation {
    
    var isSuccess = false
    var error: ApiError?
    var alamofireManager: SessionManager!
    var responseHandler: ResponseHandler!
    
    private var _executing = false
    private var _finished = false
    
    override init() {
        super.init()
        
        name = String(describing: NSStringFromClass(type(of: self)))
        
        #if DEBUG
            let configuration = Reqres.defaultSessionConfiguration()
            configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
            alamofireManager = Alamofire.SessionManager(configuration: configuration)
        #else
            alamofireManager = Alamofire.SessionManager(configuration: URLSessionConfiguration.default)
        #endif
        
        responseHandler = ResponseHandler()
    }
    
    override var isExecuting: Bool {
        return _executing
    }
    
    override var isFinished: Bool {
        return _finished
    }
    
    override func start() {
        if isCancelled {
            willChangeValue(forKey: "isFinished")
            _finished = true;
            didChangeValue(forKey: "isFinished")
            return;
        }
        
        willChangeValue(forKey: "isExecuting")
        _executing = true
        didChangeValue(forKey: "isExecuting")
        
        main()
    }
    
    override func main() {
        performRequest()
    }
    
    func performRequest() {
        
    }
    
    func completeOperation() {
        willChangeValue(forKey: "isFinished")
        willChangeValue(forKey: "isExecuting")
        _executing = false
        _finished = true
        didChangeValue(forKey: "isExecuting")
        didChangeValue(forKey: "isFinished")
    }
    
    deinit {
        debugPrint("\(NSStringFromClass(type(of: self))) -> DEINIT")
    }
}
