//
//  CharDetailDTO.swift
//  CharacterDetail
//
//  Created by Development on 30/10/2023.
//

import Foundation

public struct CharDetailDTO {
    
   public init(id: Int, name: String, status: String, species: String, type: String, image: String, episodes: [String]) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.image = image
        self.episodes = episodes
    }
    
    let id:Int
    let name, status, species, type: String
    let image: String
    let episodes: [String]
}

