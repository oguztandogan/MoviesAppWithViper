//
//  BasicTokenRequestModel.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 14.12.2020.
//

import Foundation

public class SearchRequestModel: CodableDataProtocol {

    public var query: String?
    
    public init(query: String?) {
        self.query = query
    }
}

