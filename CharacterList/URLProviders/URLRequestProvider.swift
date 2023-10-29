//
//  URLResquestProvider.swift
//  CharacterList
//
//  Created by Development on 29/10/2023.
//

import Foundation

class URLRequestProvider{
    
    func provideURLRequest(url:String) -> URLRequest{

        let url = URL(string: url )
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        return request
    }
}
