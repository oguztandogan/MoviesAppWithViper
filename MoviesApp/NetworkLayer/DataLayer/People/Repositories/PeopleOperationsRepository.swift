//
//  AuthenticationOperationsRepository.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 14.12.2020.
//

import Foundation
import RxSwift

public class PeopleOperationsRepository: PeopleRepositoryInterface {
    
    private let apiRemote: PeopleRemoteInterface!
    
    public init(apiRemote: PeopleRemoteInterface) {
        self.apiRemote = apiRemote
    }
    
    public func getPersonDetails(params: PersonDetailsRequestModel,personId: String) -> Single<PersonDetailsResponseModel> {
        return apiRemote.getPersonDetails(params: params, personId: personId)
    }
    
    public func getMovieCredits(params: MovieCreditsRequestModel,personId: String) -> Single<MovieCreditsResponseModel> {
        return apiRemote.getMovieCredits(params: params, personId: personId)
    }
}
