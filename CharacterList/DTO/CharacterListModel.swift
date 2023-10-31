//
//  CharacterListModel.swift
//  CharacterList
//
//  Created by Development on 29/10/2023.
//

import Foundation



// MARK: - CharacterList
struct CharacterList: Codable {
    let info: Info
    let results: [Result]
}

// MARK: - Info
struct Info: Codable {
    let count, pages: Int
    let next: String?
    let prev: String?
}

// MARK: - Result
struct Result: Codable {
    let id: Int
    let name: String
    let status: Status
    let species: Species?
    let type: String
    let gender: Gender
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
    case genderless = "Genderless"
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let url: String
}

enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
    case humanoid = "Humanoid"
    case unknown = "unknown"
    case poopybuthole = "Poopybutthole"
    case mythologicalCreature =  "Mythological Creature"
    case animal = "Animal"
    case robot = "Robot"
    case cronenberg = "Cronenberg"
    case disease = "Disease"
    case genderless = "Genderless"
    case gender = "gender"
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
