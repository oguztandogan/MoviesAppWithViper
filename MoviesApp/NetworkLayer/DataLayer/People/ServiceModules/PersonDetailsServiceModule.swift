//
//  AuthenticationServiceModule.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 14.12.2020.
//

import Foundation

public class PersonDetailsServiceModule: ApiServiceProvider<PersonDetailsRequestModel> {
    
    init(request: PersonDetailsRequestModel, personId: String) {
        super.init(method: .get, path: PeoplePaths.personDetails(personId).value, pathType: .tmdbBaseUrl, isAuthRequested: false, data: request)
    }
}
