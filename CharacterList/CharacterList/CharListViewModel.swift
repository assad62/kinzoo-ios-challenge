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
     @Published private (set) var url:String = ""
    
     struct Input {
         let initialUrl:String?
         let goToDetailView:(_ index:Int) -> Void
         let charService: CharListDecorator
     }
       
      struct Output {
         
      }
       
      let input: Input
      let output: Output
    
      private var cancellable = Set<AnyCancellable>()
     
        
    public init(charService: CharListDecorator,
                initialUrl:String,
                goToDetailView: @escaping(_ index:Int)->Void
    
    ) {
          
          input = Input(initialUrl: initialUrl, goToDetailView: goToDetailView, charService: charService)
          output = Output()
        
         
      }
      
    func loadList(url:String){
        
        
        guard let urlRequest = URLRequestProvider().provideURLRequest(url: url) else {
            return
        }
        
        self.input.charService.loadList(request: urlRequest)
            .sink { completion in
            } receiveValue: { [unowned self] listData in
               // self.result.removeAll()
                self.url = listData.url
                self.result.append(contentsOf: listData.results)
            }
            .store(in: &cancellable)
    }
       
    
}
