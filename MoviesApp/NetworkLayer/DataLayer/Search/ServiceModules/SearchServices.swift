//
//  AuthenticationServices.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 14.12.2020.
//

import Foundation

public class SearchServices {

    public init() {
        
    }
    
    func getMultipleSearchParsedResultServiceModule(params: SearchRequestModel) -> MultipleSearchServiceModule {
        return MultipleSearchServiceModule(request: params)
    }
}
