//
//  NetworkSessionPolicy.swift
//  Kinzoo-iOS-Challenge
//
//  Created by Development on 29/10/2023.
//

import Foundation

protocol NetworkSessionPolicy {
    
    func getUrlSessionConfig()-> URLSessionConfiguration
}


class AppSessionPolicy:NetworkSessionPolicy{
    //source:https://www.avanderlee.com/swift/urlsessionconfiguration/
    
    
    let configType:URLSessionConfiguration
    let waitsForConnectivity:Bool
    let timeOutInterval:Double
    
    init(configType: URLSessionConfiguration, waitsForConnectivity: Bool, timeOutInterval: Double) {
        self.configType = configType
        self.waitsForConnectivity = waitsForConnectivity
        self.timeOutInterval = timeOutInterval
    }
    
    func getUrlSessionConfig() -> URLSessionConfiguration {
        let configuration = configType
        configuration.waitsForConnectivity = waitsForConnectivity
        configuration.timeoutIntervalForRequest = timeOutInterval
        return configuration
    }
    
    
}
