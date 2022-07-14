//
//  AuthenticationOperationsRepository.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 14.12.2020.
//

import Foundation
import RxSwift

public class SearchOperationsRepository: SearchRepositoryInterface {
    
    private let apiRemote: SearchRemoteInterface!
    
    public init(apiRemote: SearchRemoteInterface) {
        self.apiRemote = apiRemote
    }
    
    public func getMultipleSearch(params: SearchRequestModel) -> Single<SearchResponseModel> {
        return apiRemote.getMultipleSearch(params: params)
    }
//    public func getBasicToken(params: BasicTokenRequestModel) -> Single<LoginResponseModel> {
//        return apiRemote.getBasicToken(params: params).flatMap { (basicTokenResponse) -> Single<LoginResponseModel> in
////            self.tokenProvider = basictoken
//            return self.apiRemote.getLoginToken(params: params)
//        }
//    }
}
