//
//  HttpClient.swift
//  RemoteAPI
//
//  Created by Development on 28/10/2023.
//

import Foundation
import Combine


public protocol HttpClient{}

public protocol CombineHttpClient: HttpClient{
    func execute(request: URLRequest) -> AnyPublisher<(Data, HTTPURLResponse),Error>
}

extension URLSession:CombineHttpClient{
    struct InvalidHTTPResponseError: Error {}
    
    public func execute(request: URLRequest) -> AnyPublisher<(Data, HTTPURLResponse), Error> {

        return dataTaskPublisher(for: request)
        
            .tryMap { result in
              
                guard let httpResponse = result.response as? HTTPURLResponse  else {
                   
                    throw InvalidHTTPResponseError()
                }
               
                return (result.data, httpResponse)
            }
            
            .eraseToAnyPublisher()
    }
    
    
}
