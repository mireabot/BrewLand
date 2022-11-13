//
//  TitleLabel.swift
//  BrewLand
//
//  Created by Mikhail Kolkov on 11/9/22.
//

import UIKit

class BLTitleLabel: UILabel {
    //    MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(alignment: NSTextAlignment, size: CGFloat) {
        self.init(frame: .zero)
        self.textAlignment = alignment
        self.font = UIFont.boldSystemFont(ofSize: size)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    MARK: - Helpers
    
    private func configure() {
        textColor = .label
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.90
        lineBreakMode = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints = false
    }
}
