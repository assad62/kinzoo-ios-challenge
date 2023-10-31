//
//  HeadingLabel.swift
//  CharacterDetail
//
//  Created by Development on 30/10/2023.
//

import Foundation
import UIKit

class HeadingLabel: UILabel{
    override init(frame: CGRect) {
            super.init(frame: frame)

            setupStyle()
        }

        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)

            setupStyle()
        }

        private func setupStyle() {
            
            self.font = .boldSystemFont(ofSize: 21)
            
        }
}
