//
//  CombineTableView+Extensions.swift
//  CharacterList
//
//  Created by Development on 29/10/2023.
//

import Foundation
import UIKit


//source:https://stackoverflow.com/a/67012179/1590073
extension UITableView {
    func items<Element>(_ builder: @escaping (UITableView, IndexPath, Element) -> UITableViewCell) -> ([Element]) -> Void {
        let dataSource = CombineTableViewDataSource(builder: builder)
        return { items in
            dataSource.pushElements(items, to: self)
        }
    }
}
