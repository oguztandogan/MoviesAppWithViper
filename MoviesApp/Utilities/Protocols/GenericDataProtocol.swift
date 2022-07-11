//
//  GenericDataProtocol.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 10.07.2022.
//

import Foundation

protocol GenericDataProtocol {
    
}

protocol GenericRowDataProtocol: GenericDataProtocol {
    
    var itemId: Int64 { get }
    
}
