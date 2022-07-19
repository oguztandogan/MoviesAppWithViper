//
//  KnownForCollectionViewCell.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 15.07.2022.
//

import UIKit

class CollectionViewCell: GenericCollectionViewCell<CollectionViewCellViewComponentData, CollectionViewCellViewComponent> {
    
    override func setupView() {
        super.setupView()
        setViewConfigurations()
    }
    
    func setViewConfigurations() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
    }
    
}
