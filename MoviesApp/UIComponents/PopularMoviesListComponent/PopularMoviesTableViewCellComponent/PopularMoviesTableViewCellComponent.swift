//
//  PopularMoviesTableViewCellComponent.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 10.07.2022.
//

import Foundation
import UIKit

class PopularMoviesTableViewCellComponent: GenericTableViewCell<CellViewComponentData, CellViewComponent> {
    
    override func addMajorViews() {
        super.addMajorViews()
        backgroundColor = .clear
    }
}
