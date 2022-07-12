//
//  PopularMoviesListComponentDelegate.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 10.07.2022.
//

import Foundation

protocol PopularMoviesListComponentDelegate: AnyObject {
    
    func getItemCount(in section: Int) -> Int
    func getData(at index: Int) -> GenericDataProtocol?
    func isLoadingCell(for index: Int) -> Bool
    func refreshCollectionView()
    
}

extension PopularMoviesListComponentDelegate {
    
    func refreshCollectionView() { }
    
}
