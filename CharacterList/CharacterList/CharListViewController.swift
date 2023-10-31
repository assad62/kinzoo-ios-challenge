//
//  CharacterViewController.swift
//  CharacterList
//
//  Created by Development on 28/10/2023.
//

import Foundation
import UIKit
import Combine
import SDWebImage




public class CharListViewController:UIViewController{
    
    
    private let tableView = UITableView()
    var safeArea: UILayoutGuide!
    
    var cancellable: AnyCancellable?
    
    private let vm:CharListViewModel
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init(vm:CharListViewModel){
        self.vm = vm
        super.init(nibName: nil, bundle: nil)
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        self.vm.loadList(url: self.vm.input.initialUrl ?? "")
    }
    public override func viewDidLoad() {
        super.viewDidLoad()
        safeArea = view.layoutMarginsGuide
        
      
        
        setupTableView()
        
        
        
        cancellable = vm.$result.sink(receiveValue: tableView.items { tableView, indexPath, item in
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CharacterListCell
            
            
            guard  let cell = cell else {
                
                return UITableViewCell()
            }
          
            
            
            cell.charName.text = item.name
            cell.charImageView.sd_setImage(
              with: URL(string: item.image),
              completed: { (image, err, cacheType, url) in
                                
                                if err != nil {
                                    print(err!)
                                    return
                                }

            })
            
            return cell
        })
        
        
       
        
        
        
    }
    
    
    func setupTableView(){
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CharacterListCell.self, forCellReuseIdentifier: "cell")
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)]
        )
        
    }
}




extension CharListViewController:UITableViewDelegate{
    
    
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedIndexPath = tableView.indexPathForSelectedRow
        
        
        guard let selectedIndexRow = selectedIndexPath?.row else {
            return
        }
        
        self.vm.input.goToDetailView(selectedIndexRow)
        
    }
    
    
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        // need to pass your indexpath then it showing your indicator at bottom
        tableView.addLoading(indexPath) {
            // add your code here
            // append Your array and reload your tableview
            self.vm.loadList(url: self.vm.url)
            tableView.stopLoading() // stop your indicator
        }
    }
    

}


//source:https://stackoverflow.com/a/67012179/1590073
class CombineTableViewDataSource<Element>: NSObject, UITableViewDataSource {
    
    let build: (UITableView, IndexPath, Element) -> UITableViewCell
    var elements: [Element] = []
    
    init(builder: @escaping (UITableView, IndexPath, Element) -> UITableViewCell) {
        build = builder
        super.init()
    }
    
    func pushElements(_ elements: [Element], to tableView: UITableView) {
        DispatchQueue.main.async {
            tableView.dataSource = self
            
            self.elements = elements
            tableView.reloadData()
        }
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        build(tableView, indexPath, elements[indexPath.row])
    }
}
