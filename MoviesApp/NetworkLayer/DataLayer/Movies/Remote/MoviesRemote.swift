//
//  AuthenticationOperationsRemote.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 14.12.2020.
//

import Foundation
import RxSwift

public class MoviesRemote: MoviesRemoteInterface {

    private let apiManager: HttpClientInterface!
    private let service: MoviesServices!

    public init(apiManager: HttpClientInterface, service: MoviesServices) {
        self.apiManager = apiManager
        self.service = service
    }

    // TODO
    public func getPopularMovies(params: PopularMoviesRequestModel) -> Single<PopularMoviesResponseModel> {
        return apiManager.executeRequest(urlRequestConvertible: service.getPopularMoviesParsedResultServiceModule(params: params))
    }

    deinit {
        print("DEINIT LoginOperationsRemote")
    }
}

//public class BasicTokenOperationsRemote: BasicTokenOperationsRemoteInterface {
//    public func getLoginToken(params: BasicTokenRequestModel) -> Single<LoginResponseModel> {
//        return apiManager.executeRequest(urlRequestConvertible: service.getBasicTokenParsedResultServiceModule(params: params))
//    }
//
//
//        private let apiManager: HttpClientInterface!
//        private let service: BasicTokenServices!
//
//        public init(apiManager: HttpClientInterface, service: BasicTokenServices) {
//            self.apiManager = apiManager
//            self.service = service
//        }
//
//        // TODO
//        public func getBasicToken(params: BasicTokenRequestModel) -> Single<BasicTokenResponseModel> {
//            return apiManager.executeRequest(urlRequestConvertible: service.getBasicTokenParsedResultServiceModule(params: params))
//        }
//
//        deinit {
//            print("DEINIT LoginOperationsRemote")
//        }
//}
