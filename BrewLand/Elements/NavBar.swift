//
//  NavBar.swift
//  BrewLand
//
//  Created by Mikhail Kolkov on 11/10/22.
//

import UIKit


class BLNavBar: UIView {
    
    private let logoImage : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "brewImage")
        iv.contentMode = .scaleAspectFit
        iv.setDimensions(width: 24, height: 24)
        
        return iv
    }()
    
    private let titleLabel = BLTitleLabel(alignment: .left, size: 24)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureTopBar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTopBar() {
        addSubview(logoImage)
        addSubview(titleLabel)
        
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = "Brew Land"
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            logoImage.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.leftAnchor.constraint(equalTo: logoImage.rightAnchor, constant: 10)
        ])
    }
    
}
