//
//  CharacterListCell.swift
//  CharacterList
//
//  Created by Development on 29/10/2023.
//

import Foundation
import UIKit
import SDWebImage

class CharacterListCell: UITableViewCell {
    
    
    let stackView = UIStackView()
    
    let charName = UILabel()
    
    var charImageView: UIImageView = {
           let img = UIImageView()
           img.contentMode = .scaleAspectFit
           img.translatesAutoresizingMaskIntoConstraints = false
           img.clipsToBounds = true
           return img
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Set any attributes of your UI components here.
        charName.translatesAutoresizingMaskIntoConstraints = false
        charName.font = UIFont.systemFont(ofSize: 20)
        charName.textAlignment = .center
        
        
          
        stackView.addArrangedSubview(charImageView)
        stackView.addArrangedSubview(charName)
       
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .equalCentering
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(stackView)
        
        
        //Important: As image takes longer to load than label, if we dont set a height for the imageView the tableview cell will ignore the image and just load with the height of the label
        
        NSLayoutConstraint.activate([
            charImageView.heightAnchor.constraint(equalToConstant: 300),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 20),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -0),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
       
    }

}
