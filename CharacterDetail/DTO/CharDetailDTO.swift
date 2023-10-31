//
//  CharDetailDTO.swift
//  CharacterDetail
//
//  Created by Development on 30/10/2023.
//

import Foundation

public struct CharDetailDTO {
    let id:Int
    let name, status, species, type: String
    let image: String
    let episodes: [String]
}

