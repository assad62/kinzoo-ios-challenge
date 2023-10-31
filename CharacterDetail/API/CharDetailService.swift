//
//  CharDetailService.swift
//  CharacterDetail
//
//  Created by Development on 30/10/2023.
//

import Foundation
import Combine
import RemoteAPI

public protocol APISerivce {
    var httpClient:CombineHttpClient {get set}
}


public protocol CharDetailDecorator:APISerivce{
     func loadDetails(request: URLRequest) -> AnyPublisher<CharDetailDTO,Error>
}

public struct CharDetailService:CharDetailDecorator {
    public var httpClient: RemoteAPI.CombineHttpClient
    
    public init(httpClient: RemoteAPI.CombineHttpClient) {
        self.httpClient = httpClient
    }
    
    public func loadDetails(request: URLRequest) -> AnyPublisher<CharDetailDTO, Error> {
        
          return httpClient
                .execute(request: request)
                .tryMap(CharDetailMap.map)
                .eraseToAnyPublisher()
    }
    
   
    
    
}
