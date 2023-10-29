//
//  CharacterListMap.swift
//  CharacterList
//
//  Created by Development on 28/10/2023.
//

import Foundation


struct CharacterListMap {
    static func map(data:Data, response:HTTPURLResponse) throws -> [Result]{
        
      if response.statusCode == 200 {
            let decoder = JSONDecoder()
          
               do {
                    let list = try decoder.decode(CharacterList.self, from: data)
                     return list.results
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

          
          
           
        }
            
        return []
    }
    
    
}
