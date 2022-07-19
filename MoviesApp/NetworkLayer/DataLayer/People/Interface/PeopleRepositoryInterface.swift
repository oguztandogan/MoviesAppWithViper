//
//  AuthenticationOperationsRepositoryInterface.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 14.12.2020.
//

import Foundation
import RxSwift

public protocol PeopleRepositoryInterface {
    
    func getPersonDetails(params: PersonDetailsRequestModel, personId: String) -> Single<PersonDetailsResponseModel>
    func getMovieCredits(params: MovieCreditsRequestModel, personId: String) -> Single<MovieCreditsResponseModel>
}
