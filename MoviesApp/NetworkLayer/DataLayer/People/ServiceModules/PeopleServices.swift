//
//  AuthenticationServices.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 14.12.2020.
//

import Foundation

public class PeopleServices {

    public init() {
        
    }
    
    func getMovieCreditsParsedResultServiceModule(params: MovieCreditsRequestModel, personId: String) -> MovieCreditsServiceModule {
        return MovieCreditsServiceModule(request: params, personId: personId)
    }
    
    func getPersonDetailsParsedResultServiceModule(params: PersonDetailsRequestModel, personId: String) -> PersonDetailsServiceModule {
        return PersonDetailsServiceModule(request: params, personId: personId)
    }
}
