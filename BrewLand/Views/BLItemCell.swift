//
//  BLItemCell.swift
//  BrewLand
//
//  Created by Mikhail Kolkov on 11/9/22.
//

import UIKit

class BLItemCell : UICollectionViewCell {
    //MARK: - Properties
    
    private let logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "brewImage")
        image.contentMode = .scaleAspectFit
        image.setDimensions(width: 24, height: 24)
        
        return image
    }()
    
    static let itemIdentifier = "BLItemCell"
    
    private let titleLabel = BLTitleLabel(alignment: .left, size: 20)

    private let addressLabel = BLBodyLabel(alignment: .left)
    
    private let typeLabel = BLPaddingLabel()
    
    var breweryData: Brewery?
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        configureType()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    func setData(brewery: Brewery) {
        titleLabel.text = brewery.name
        addressLabel.text = "\(brewery.street), \(brewery.city), \(brewery.state), \(brewery.postalCode)"
        typeLabel.text = brewery.breweryType
    }
    
    private func configureUI() {
        addSubview(logoImage)
        
        backgroundColor = .white
        
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(titleLabel)
        titleLabel.text = "16 Stone Brewpub"
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(addressLabel)
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.text = "9542 Main St, New York, New York, 13354"
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            logoImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 19),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            titleLabel.leftAnchor.constraint(equalTo: logoImage.rightAnchor, constant: 10),
            
            addressLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 10),
            addressLabel.leftAnchor.constraint(equalTo: logoImage.leftAnchor)
        ])
    }
    
    func configureType() {
        addSubview(typeLabel)
        
        
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        typeLabel.backgroundColor = .brewery
        typeLabel.padding = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        typeLabel.text = "Brewery"
        typeLabel.sizeToFit()
        typeLabel.layer.cornerRadius = 5
        typeLabel.layer.masksToBounds = true
        
        NSLayoutConstraint.activate([
            typeLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 10),
            typeLabel.leftAnchor.constraint(equalTo: logoImage.leftAnchor)
        ])
    }
}
