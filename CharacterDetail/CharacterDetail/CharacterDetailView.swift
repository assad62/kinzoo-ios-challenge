//
//  CharacterDetailView.swift
//  CharacterDetail
//
//  Created by Development on 29/10/2023.
//

import Foundation
import UIKit

public class CharacterDetailView:UIView{
    
    let scrollView = {
        let scrollView = UIScrollView()
        scrollView.automaticallyAdjustsScrollIndicatorInsets = false
        return scrollView
    }()
    
    
    let stackView = UIStackView()
    
    let headerName = HeadingLabel()
    let headerStatus = HeadingLabel()
    let headerSpecies = HeadingLabel()
    let headerEpisodeList = HeadingLabel()
    
    
    let charName:UILabel = UILabel()
    let charStatus:UILabel = UILabel()
    let charSpecies:UILabel = UILabel()
    
    let episodesList:UILabel = {
        let textLabel = UILabel()
        textLabel.numberOfLines = 0
        
        return textLabel
    }()
    
    let headerNameTitle:String
    let headerStatusTitle:String
    let headerSpeciesTitle:String
    let headerEpisodeListTitle:String
    
    var charImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        return img
    }()
    
   
    
    public required init(headerNameTitle:String, headerStatusTitle:String, headerSpeciesTitle:String,headerEpisodeListTitle:String) {
        self.headerNameTitle = headerNameTitle
        self.headerStatusTitle = headerStatusTitle
        self.headerSpeciesTitle = headerSpeciesTitle
        self.headerEpisodeListTitle = headerEpisodeListTitle
        
        super.init(frame: CGRect.zero)
        addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        stackView.axis = .vertical
        
        scrollView.addSubview(stackView)
        
        
        
        backgroundColor = .systemBackground
        
        
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: centerXAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        
        
        setupView()
       
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
        ])
        
        
        
        
    
    }
    
    func setupView(){
        
        headerName.text = headerNameTitle
        headerStatus.text = headerStatusTitle
        headerSpecies.text = headerSpeciesTitle
        headerEpisodeList.text = headerEpisodeListTitle
        
        stackView.addArrangedSubview(charImageView)
        
        stackView.addArrangedSubview(headerName)
        stackView.addArrangedSubview(charName)
        
        stackView.addArrangedSubview(headerStatus)
        stackView.addArrangedSubview(charStatus)
        
        stackView.addArrangedSubview(headerSpecies)
        stackView.addArrangedSubview(charSpecies)
        
        stackView.addArrangedSubview(headerEpisodeList)
        stackView.addArrangedSubview(episodesList)
    }
    
    
    required init?(coder:NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
}
