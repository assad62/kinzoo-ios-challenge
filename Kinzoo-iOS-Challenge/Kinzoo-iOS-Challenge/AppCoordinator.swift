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

protocol Coordinator {
 
    var navigationController: UINavigationController { get set }
    func start()
}

class AppCoordinator:Coordinator {
    
    
    enum Path{
        case list
        case detail
    }
    
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
    }
    
    func start() {
        
        let vm = CharListViewModel(goToDetailView: goToDetailView)
        navigationController.pushViewController(CharListViewController(vm: vm), animated: true)
    }
    
    
    func goToDetailView(){
        navigationController.pushViewController(CharacterDetailViewController(), animated: true)
    }
    
}
