//
//  CharacterListViewModel.swift
//  CharacterList
//
//  Created by Development on 28/10/2023.
//

import Foundation
import Combine
import RemoteAPI

protocol ViewModelType{
    associatedtype Input
    associatedtype Output
      
    var input: Input { get }
    var output: Output { get }
}

public class CharListViewModel:ViewModelType{
    
     @Published private (set) var result:[Result] = []
     struct Input {
         let goToDetailView:() -> Void
     }
       
      struct Output {}
       
      let input: Input
      let output: Output
      var charService: CharListDecorator
      private var cancellable = Set<AnyCancellable>()
     
        
      public init(charService: CharListDecorator = CharacterListService(httpClient: URLSession.shared), goToDetailView: @escaping()->Void) {
          
          input = Input(goToDetailView: goToDetailView)
          output = Output()
          self.charService = charService
         
      }
      
    func loadList(url:String = "https://rickandmortyapi.com/api/character" ){
        
        charService.loadList(request: URLRequestProvider().provideURLRequest(url: url))
            .sink { completion in
            } receiveValue: { [unowned self] listData in
                self.result.removeAll()
                self.result.append(contentsOf: listData)
            }
            .store(in: &cancellable)
    }
       
    
}
