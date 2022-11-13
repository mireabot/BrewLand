//
//  BreweryListController.swift
//  BrewLand
//
//  Created by Mikhail Kolkov on 11/9/22.
//

import UIKit

class BreweryListController: UIViewController {
    //    MARK: - Properties
    
    private let navBar = BLNavBar()
    
    private var itemsCollection: UICollectionView!
    
    var breweries: [Brewery] = []
    
    //    MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.titleView = navBar
        configureFilterCollection()
        getBrewery(page: 10)
    }
    
    //    MARK: - Helpers
    
    func configureFilterCollection() {
        itemsCollection = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createCustomFlowLayout(in: view))
        itemsCollection.backgroundColor = .systemBackground
        itemsCollection.dataSource = self
        itemsCollection.register(BLItemCell.self, forCellWithReuseIdentifier: BLItemCell.itemIdentifier)
        
        view.addSubview(itemsCollection)
    }
    
    func getBrewery(page: Int) {
        Networkmanager.shared.getBreweryData(page: page) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let brewery):
                self.breweries = brewery
                print(self.breweries)
                DispatchQueue.main.async {
                    self.itemsCollection.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

//MARK: - UICollectionViewDataSource

extension BreweryListController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return breweries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BLItemCell.itemIdentifier, for: indexPath) as! BLItemCell
        
        cell.setData(brewery: breweries[indexPath.row])
        
        return cell
    }
}
