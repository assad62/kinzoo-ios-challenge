//
//  CharacterDTO.swift
//  CharacterList
//
//  Created by Development on 28/10/2023.
//

import Foundation

//conform to equtable for mock
public struct CharListDTO:Equatable{
    public static func == (lhs: CharListDTO, rhs: CharListDTO) -> Bool {
        return lhs.results == rhs.results && lhs.url == rhs.url
    }
    
    public init(url: String, results: [CharResult]) {
        self.url = url
        self.results = results
    }
    
    let url:String
    let results:[CharResult]
}

public struct CharResult:Equatable {
    
    public init(image: String, name: String) {
        self.image = image
        self.name = name
    }
    let image:String
    let name:String
}
