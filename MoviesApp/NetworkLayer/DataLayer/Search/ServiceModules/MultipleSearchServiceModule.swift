//
//  AuthenticationServiceModule.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 14.12.2020.
//

import Foundation

public class MultipleSearchServiceModule: ApiServiceProvider<SearchRequestModel> {
    
    init(request: SearchRequestModel) {
        super.init(method: .get, path: SearchPaths.multipleSearch.value, pathType: .tmdbBaseUrl, isAuthRequested: false, data: request)
    }
}
