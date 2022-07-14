//
//  AuthenticationOperationsRemote.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 14.12.2020.
//

import Foundation
import RxSwift

public class SearchOperationsRemote: SearchRemoteInterface {

    private let apiManager: HttpClientInterface!
    private let service: SearchServices!

    public init(apiManager: HttpClientInterface, service: SearchServices) {
        self.apiManager = apiManager
        self.service = service
    }

    // TODO
    public func getMultipleSearch(params: SearchRequestModel) -> Single<SearchResponseModel> {
        return apiManager.executeRequest(urlRequestConvertible: service.getMultipleSearchParsedResultServiceModule(params: params))
    }

    deinit {
        print("DEINIT LoginOperationsRemote")
    }
}
