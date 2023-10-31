//
//  AppCoordinator.swift
//  Kinzoo-iOS-Challenge
//
//  Created by Development on 28/10/2023.
//

import Foundation
import UIKit
import CharacterList
import CharacterDetail

protocol BaseCoordinator {
    var navigationController: UINavigationController { get set }
    func start(path:AppCoordinator.Path)
   
}

protocol AppCordinatorDecorator:BaseCoordinator{
    func getUrlPath (path:AppCoordinator.Path) ->String
    func composeListView() ->UIViewController
    func composeDetailView(index:Int?) ->UIViewController
}


class AppCoordinator:AppCordinatorDecorator {
    
    
    func getUrlPath(path: Path) -> String {
        
        switch path {
          case .list:
              return "character"
          case .detail:
              return "character/:id"
        }
    }
    
    
    
    enum Path{
        case list
        case detail
    }
    
    
    var navigationController: UINavigationController
    var appConfig:Configuration
    var sessionConfig:NetworkSessionPolicy
    
    init(navigationController: UINavigationController, appConfig:Configuration, sessionConfig:NetworkSessionPolicy) {
        self.navigationController = navigationController
        self.appConfig = appConfig
        self.sessionConfig = sessionConfig
        
    }
    
    func start(path:AppCoordinator.Path) {
        
        switch path {
           case.list:
              goToListView()
            
          case .detail:
             goToDetailView()
        }
       
       
    }
    
    
    
    func composeListView() -> UIViewController {
        let initialUrl = "\(appConfig.getBaseUrl())\(getUrlPath(path: .list))"
        let service = CharacterListService(httpClient: URLSession(configuration: sessionConfig.getUrlSessionConfig()))
        let vm = CharListViewModel(
            charService: service,
            initialUrl:initialUrl, 
            goToDetailView: goToDetailView)
        
        let vc = CharListViewController(vm: vm)
        vc.title = "R&M List"
        
        return vc
    }
    
    func composeDetailView(index:Int? = nil) ->UIViewController{
        
        guard let index = index else {
            return UIViewController()
        }
        
       
        let url = "\(appConfig.getBaseUrl())\(getUrlPath(path: .detail))".replacingOccurrences(of: ":id", with: "\(index+1)")
      
        let view = CharacterDetailView(
            headerNameTitle: "Name",
            headerStatusTitle: "Status",
            headerSpeciesTitle: "Species",
            headerEpisodeListTitle: "Episode List")
        
        let service = CharDetailService(httpClient: URLSession(configuration: sessionConfig.getUrlSessionConfig()))
      
        let vm = CharDetailViewModel(index: index, charDetailService: service,url: url)
        let vc = CharacterDetailViewController(view:view, vm: vm)
        vc.title = "R&M Details"
        return vc
    }
    
    
    func goToListView(){
        let vc = composeListView()
        navigationController.pushViewController(vc, animated: true)
    }
    
    func goToDetailView(index:Int = 1)  {
        let vc = composeDetailView(index: index)
        navigationController.pushViewController(vc, animated: true)
    }
    
}
