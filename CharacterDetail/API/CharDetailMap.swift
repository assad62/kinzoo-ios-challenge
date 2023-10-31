//
//  CharDetailMap.swift
//  CharacterDetail
//
//  Created by Development on 30/10/2023.
//

import Foundation


struct CharDetailMap {
    static func map(data:Data, response:HTTPURLResponse) throws -> CharDetailDTO{
        
        if response.statusCode == 200 {
              let decoder = JSONDecoder()
            
                 do {
                       let characterDetails = try decoder.decode(CharDetail.self, from: data)
                    
                       return CharDetailDTO(id: characterDetails.id,
                                            name: characterDetails.name,
                                            status: characterDetails.status,
                                            species: characterDetails.species,
                                            type: characterDetails.type,
                                            image: characterDetails.image,
                                            episodes: characterDetails.episode)
                     
                    } catch let DecodingError.keyNotFound(key, context) {
                        print("Decoding error (keyNotFound): \(key) not found in \(context.debugDescription)")
                        print("Coding path: \(context.codingPath)")
                    } catch let DecodingError.dataCorrupted(context) {
                        print("Decoding error (dataCorrupted): data corrupted in \(context.debugDescription)")
                        print("Coding path: \(context.codingPath)")
                    } catch let DecodingError.typeMismatch(type, context) {
                        print("Decoding error (typeMismatch): type mismatch of \(type) in \(context.debugDescription)")
                        print("Coding path: \(context.codingPath)")
                    } catch let DecodingError.valueNotFound(type, context) {
                        print("Decoding error (valueNotFound): value not found for \(type) in \(context.debugDescription)")
                        print("Coding path: \(context.codingPath)")
                    }
   
                  return CharDetailDTO(id: -1, name: "", status: "", species: "", type: "", image: "", episodes: [])
        }
              
       
        return CharDetailDTO(id: -1, name: "", status: "", species: "", type: "", image: "", episodes: [])
        
        
    }
}
