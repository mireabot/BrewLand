//
//  BodyLabel.swift
//  BrewLand
//
//  Created by Mikhail Kolkov on 11/9/22.
//

import UIKit

class BLBodyLabel: UILabel {
    //    MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(alignment: NSTextAlignment) {
        self.init(frame: .zero)
        self.textAlignment = alignment
        self.font = UIFont.preferredFont(forTextStyle: .body)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    MARK: - Helpers
    
    func configureUI() {
        textColor = .secondaryLabel
        minimumScaleFactor = 0.90
        lineBreakMode = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints = false
    }
}
