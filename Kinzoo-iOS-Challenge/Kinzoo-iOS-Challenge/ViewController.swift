////
////  ViewController.swift
////  Kinzoo-iOS-Challenge
////
////  Created by Development on 28/10/2023.
////
//
//import UIKit
//import RemoteAPI
//import Combine
//
//
//// MARK: - Todo
//struct Todo: Codable {
//    let userID, id: Int
//    let title: String
//    let completed: Bool
//
//    enum CodingKeys: String, CodingKey {
//        case userID = "userId"
//        case id, title, completed
//    }
//}
//
//typealias Todos = [Todo]
//
//
//
//
//
//protocol CharacterListDecorator:APISerivce{
//    func loadList(request: URLRequest) -> AnyPublisher<[Todo],Error>
//
//}
//
//
//
//
//
//class TestViewModel{
//    
//    var cancellable = Set<AnyCancellable>()
//    
//  
//    func onload() {
//        print("9910 inside")
//        
//
//        
//        
//        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos")
//             else {
//                    return
//                }
//        
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        
//        
//        let a =  CharacterService(httpClient: URLSession.shared).loadList(request: request)
//        print("9910 cancellable is \(cancellable)")
//        a.sink { res in
//             print("9910 complet is \(res)")
//        } receiveValue: { res in
//              print ("9910 is \(res)")
//        }
//        .store(in: &cancellable)
//        
//       
//        print("9910 cancellable is \(cancellable)")
//        
//    }
//    
//    
//    
//}
//
//
//class ViewController: UIViewController {
//
//    
//    var  cancellable = Set<AnyCancellable>()
//    let vm = TestViewModel()
//    
//     override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        self.view.backgroundColor = .cyan
//      
//      
//        vm.onload()
//        //onload()
//        
//                
////        var request = URLRequest(url: url)
////        request.httpMethod = "GET"
////        
////         URLSession.shared.execute(request: request).sink { err in
////            print("error is \(err)")
////        } receiveValue: { data, response in
////            let decoder = JSONDecoder()
////
////            if let jsonPetitions = try? decoder.decode(Todos.self, from: data) {
////                print(jsonPetitions[0].title)
////                    
////            }
////            
////        }.store(in: &cancellable)
//        
//    
//
//        
//        
//        // Do any additional setup after loading the view.
//    }
//
//    
//    override func viewDidAppear(_ animated: Bool) {
//       
//    }
//
//}
//
