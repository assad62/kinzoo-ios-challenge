//
//  CharDetailViewModel.swift
//  CharacterDetail
//
//  Created by Development on 30/10/2023.
//

import Foundation
import Combine
protocol ViewModelType{
    associatedtype Input
    associatedtype Output
      
    var input: Input { get }
    var output: Output { get }
}


public class CharDetailViewModel:ViewModelType {
    
     private var cancellable = Set<AnyCancellable>()
     struct Input {
        let charIndex:Int
        let charDetailService: CharDetailDecorator
        let url:String
     }
      
     struct Output {
         let characterDetails = CurrentValueSubject<CharDetailDTO?, Never>(nil)
     }
      
     let input: Input
     let output: Output
    
    public init(index:Int, charDetailService:CharDetailDecorator, url:String) {
        
        self.input = Input(charIndex: index, charDetailService: charDetailService, url: url)
        self.output = Output()
    }
    
    func loadDetails(url:String){
        
        guard let urlRequest = URLRequestProvider().provideURLRequest(url: url) else {
            return
        }
        
        self.input.charDetailService.loadDetails(request: urlRequest)
            .sink { completion in
            } receiveValue: { [unowned self] details in
      
                self.output.characterDetails.send(details)
            }
            .store(in: &cancellable)
    }
    
    
    
    
    func formatEpisodeList(episodes:[String]) ->String {
        return episodes.map(
            { URL(string: $0)?.lastPathComponent})
        .compactMap({$0})
        .joined(separator: ",")
    }
    
    
    
    
}
