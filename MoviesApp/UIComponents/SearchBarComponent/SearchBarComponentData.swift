//
//  SearchBarComponentData.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 12.07.2022.
//

import Foundation
import UIKit

class SearchBarComponentData: GenericDataProtocol {
    
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        
        self.navigationController = navigationController
    }
}
