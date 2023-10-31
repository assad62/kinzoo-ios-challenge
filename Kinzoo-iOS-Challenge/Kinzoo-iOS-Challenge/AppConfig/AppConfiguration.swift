//
//  AppConfiguration.swift
//  Kinzoo-iOS-Challenge
//
//  Created by Development on 29/10/2023.
//

import Foundation

protocol Configuration {
   
    func getBaseUrl()-> String
    
}


class AppConfiguration:Configuration {
    var baseUrl:String
    
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    func getBaseUrl() -> String {
        return baseUrl
    }
}


