//
//  CharacterDetailViewController.swift
//  CharacterDetail
//
//  Created by Development on 28/10/2023.
//

import Foundation
import Combine
import UIKit
import SDWebImage

public class CharacterDetailViewController:UIViewController{
    
    public let detailView:CharacterDetailView?
    public let vm:CharDetailViewModel?
   
    var cancellables = Set<AnyCancellable>()
    
    public init(view: CharacterDetailView,vm:CharDetailViewModel) {
        self.detailView = view
        self.vm = vm
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        
        guard let url = vm?.input.url else {
            return
        }
        vm?.loadDetails(url: url)
        
        
      
    }
    
    
    public override func viewDidAppear(_ animated: Bool) {
      
        vm?.output.characterDetails
            .subscribe(on: DispatchQueue.global(qos: .background))
            .compactMap({$0})
            .sink(
             receiveValue: { [unowned self] details in
                
                
                DispatchQueue.main.async {
                   
                  
                    self.detailView?.charImageView.sd_setImage(
                        with: URL(string: details.image),
                      completed: { (image, err, cacheType, url) in
                                        
                                        if err != nil {
                                            print(err!)
                                            return
                                        }

                    })
                    self.detailView?.charName.text = details.name
                    self.detailView?.charStatus.text = details.status
                    self.detailView?.charSpecies.text = details.species
                    self.detailView?.episodesList.text = self.vm?.formatEpisodeList(episodes: details.episodes)
                  
                }
                    
                
       
            }).store(in: &cancellables)
    }
    

    public override func loadView() {
        self.view = detailView
    }
}
