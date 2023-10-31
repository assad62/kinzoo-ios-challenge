//
//  MockCharDetailService.swift
//  CharacterDetailTests
//
//  Created by Development on 31/10/2023.
//

import Foundation
import Combine
import RemoteAPI
import CharacterDetail

struct MockApiFailService:CharDetailDecorator{
   
    
    struct APIError: Error {
        public var errorCode: Int
        public var erorrMessage: String
    }
    var httpClient: RemoteAPI.CombineHttpClient
    
    func loadDetails(request: URLRequest) -> AnyPublisher<CharDetailDTO, Error> {
        let error = APIError(errorCode: 404, erorrMessage: "API Error")
        return Fail(error:error)
            .eraseToAnyPublisher()
    }
}


struct MockApiSuccessService:CharDetailDecorator{
    
    func loadDetails(request: URLRequest) -> AnyPublisher<CharDetailDTO, Error> {
       
        let data = CharDetailDTO(id: 0, name: "Name",
                                 status: "String",
                                 species: "Species",
                                 type: "type",
                                 image: "image",
                                 episodes: ["1","2"])
        
        return Just(data)
                   .setFailureType(to: Error.self)
                   .eraseToAnyPublisher()
        
    }
    
    var httpClient: RemoteAPI.CombineHttpClient
    
    
}
