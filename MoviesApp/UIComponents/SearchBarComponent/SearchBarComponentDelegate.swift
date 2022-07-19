//
//  SearchBarComponentDelegate.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 12.07.2022.
//

import Foundation
import UIKit

protocol SearchBarComponentDelegate: AnyObject {
    
    func getSearchBarText(searchText: String)
    func cancelButtonClicked()
}
