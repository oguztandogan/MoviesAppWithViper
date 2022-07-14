//
//  AuthenticationOperationsRemoteInterface.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 14.12.2020.
//

import Foundation
import RxSwift

public protocol SearchRemoteInterface {
    
    func getMultipleSearch(params: SearchRequestModel) -> Single<SearchResponseModel>
    
}
