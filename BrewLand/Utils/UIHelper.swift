//
//  UIHelper.swift
//  BrewLand
//
//  Created by Mikhail Kolkov on 11/9/22.
//

import UIKit


struct UIHelper {
    static func createCustomFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let padding: CGFloat = 12
        let minimumItemSpacing: CGFloat = 10
        
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        layout.itemSize = CGSize(width: view.bounds.width, height: 140)
        layout.minimumLineSpacing = minimumItemSpacing
        layout.minimumInteritemSpacing = minimumItemSpacing
        
        return layout
    }
}

