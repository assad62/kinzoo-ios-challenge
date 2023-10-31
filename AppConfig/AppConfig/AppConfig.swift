//
//  AppConfig.swift
//  AppConfig
//
//  Created by Development on 29/10/2023.
//

import Foundation

protocol Configuration{
    func getBaseUrl() -> String
    func getSessionConfig() ->URLSessionConfiguration
}

public class AppConfig:Configuration{
    
    let baseUrl:String
    
    
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
     func getBaseUrl() -> String {
        return baseUrl
    }
    
    func getSessionConfig() -> URLSessionConfiguration {
         
        return URLSessionConfiguration.default
    }
    
}
