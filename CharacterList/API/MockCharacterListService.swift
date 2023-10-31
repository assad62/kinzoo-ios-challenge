//
//  MockCharacterListService.swift
//  CharacterListTests
//
//  Created by Development on 31/10/2023.
//

import Foundation
import Combine
import RemoteAPI
import CharacterList

struct MockApiFailService:CharListDecorator{
    struct APIError: Error {
        public var errorCode: Int
        public var erorrMessage: String
    }
    var httpClient: RemoteAPI.CombineHttpClient
    
    func loadList(request: URLRequest) -> AnyPublisher<CharListDTO, Error> {
        let error = APIError(errorCode: 404, erorrMessage: "API Error")
        return Fail(error:error)
            .eraseToAnyPublisher()
    }
}


struct MockApiSuccessService:CharListDecorator{
    
    func loadList(request: URLRequest) -> AnyPublisher<CharListDTO, Error> {
       
        let data = CharListDTO(url: "http://www.myurl.com", results:[
            CharResult(image: "urltostring", name: "name")
        ])
        
        return Just(data)
                   .setFailureType(to: Error.self)
                   .eraseToAnyPublisher()
        
    }
    
    var httpClient: RemoteAPI.CombineHttpClient
    
    
}

