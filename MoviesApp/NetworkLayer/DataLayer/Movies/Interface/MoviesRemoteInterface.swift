//
//  AuthenticationOperationsRemoteInterface.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 14.12.2020.
//

import Foundation
import RxSwift

public protocol MoviesRemoteInterface {
    
    func getPopularMovies(params: PopularMoviesRequestModel) -> Single<PopularMoviesResponseModel>
}
