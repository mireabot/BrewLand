//
//  Extensions.swift
//  BrewLand
//
//  Created by Mikhail Kolkov on 11/9/22.
//

import UIKit

//MARK: - UIColor

extension UIColor {
    static let brewery = UIColor(red: 255, green: 224, blue: 0, alpha: 1)
}

// MARK: - UIView

extension UIView {
    func setDimensions(width: CGFloat? = 0, height: CGFloat? = 0) {
            translatesAutoresizingMaskIntoConstraints = false
            widthAnchor.constraint(equalToConstant: width!).isActive = true
            heightAnchor.constraint(equalToConstant: height!).isActive = true
        }
}
