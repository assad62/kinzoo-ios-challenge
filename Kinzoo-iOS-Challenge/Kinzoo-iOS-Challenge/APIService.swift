//
//  APIService.swift
//  Kinzoo-iOS-Challenge
//
//  Created by Development on 28/10/2023.
//

import Foundation
import RemoteAPI

protocol APISerivce {
    var httpClient:CombineHttpClient {get set}
}
