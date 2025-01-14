//
//  CharDetailModel.swift
//  CharacterDetail
//
//  Created by Development on 30/10/2023.
//

import Foundation


// MARK: - CharacterDetail
struct CharDetail: Codable {
    let id: Int
    let name, status, species, type: String
    let gender: String
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let url: String
}
