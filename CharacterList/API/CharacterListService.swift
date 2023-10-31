//
//  CharacterListService.swift
//  CharacterList
//
//  Created by Development on 28/10/2023.
//

import Foundation
import Combine
import RemoteAPI

public protocol APISerivce {
    var httpClient:CombineHttpClient {get set}
}


public protocol CharListDecorator:APISerivce{
     func loadList(request: URLRequest) -> AnyPublisher<CharListDTO,Error>
}



public struct CharacterListService:CharListDecorator {
    
    
    public var httpClient: RemoteAPI.CombineHttpClient
    
    public init(httpClient: RemoteAPI.CombineHttpClient) {
        self.httpClient = httpClient
    }
    
    public func loadList(request: URLRequest) ->  AnyPublisher<CharListDTO,Error> {
        
        return httpClient
                .execute(request: request)
                .tryMap(CharacterListMap.map)
                .eraseToAnyPublisher()
       
    }
    
}


