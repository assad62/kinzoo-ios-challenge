//
//  URLStringProvider.swift
//  CharacterList
//
//  Created by Development on 29/10/2023.
//

import Foundation

class URLStringProvider {
    
    let urlString:String
    
    init(urlString: String) {
        self.urlString = urlString
    }
    
    func provideURLRequest(url:String? = nil) -> String{

        guard  let url = url else {
            return urlString
        }
        
        return url
    }
}
