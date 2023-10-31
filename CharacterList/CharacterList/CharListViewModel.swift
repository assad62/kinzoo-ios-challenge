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
    
    
    
     struct Input {
         let initialUrl:String?
         let goToDetailView:(_ index:Int) -> Void
         let charService: CharListDecorator
     }
       
      struct Output {
          let charList = CurrentValueSubject<[CharResult], Never>([])
          let url = CurrentValueSubject<String,Never>("")
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
               
                self.output.url.send(listData.url)
                self.output.charList.value.append(contentsOf: listData.results)
            }
            .store(in: &cancellable)
        
        
    }
       
    
}
