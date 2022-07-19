//
//  KnownForCollectionViewComponentDelegate.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 15.07.2022.
//

import Foundation

protocol CollectionViewComponentDelegate: AnyObject {
    
    func getItemCount() -> Int
    func getData(index: Int) -> GenericDataProtocol?
//    func isLoadingCell(index: Int) -> Bool
    
}
