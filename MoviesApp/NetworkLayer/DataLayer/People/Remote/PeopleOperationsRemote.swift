//
//  AuthenticationOperationsRemote.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 14.12.2020.
//

import Foundation
import RxSwift

public class PeopleOperationsRemote: PeopleRemoteInterface {

    private let apiManager: HttpClientInterface!
    private let service: PeopleServices!

    public init(apiManager: HttpClientInterface, service: PeopleServices) {
        self.apiManager = apiManager
        self.service = service
    }

    public func getPersonDetails(params: PersonDetailsRequestModel, personId: String) -> Single<PersonDetailsResponseModel> {
        return apiManager.executeRequest(urlRequestConvertible: service.getPersonDetailsParsedResultServiceModule(params: params, personId: personId))
    }
    
    public func getMovieCredits(params: MovieCreditsRequestModel, personId: String) -> Single<MovieCreditsResponseModel> {
        return apiManager.executeRequest(urlRequestConvertible: service.getMovieCreditsParsedResultServiceModule(params: params, personId: personId))
    }

    deinit {
        print("DEINIT LoginOperationsRemote")
    }
}
