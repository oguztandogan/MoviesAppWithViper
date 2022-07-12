//
//  GetBasicTokenUsecase.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 13.12.2020.
//

import Foundation
import RxSwift

public class PopularMoviesUsecase: SingleUseCase<PopularMoviesRequestModel, PopularMoviesResponseModel> {
    
    private let repository: MoviesRepositoryInterface!
    
    public init(repository: MoviesRepositoryInterface) {
        self.repository = repository
    }
    
    override func generateUseCase(parameter: PopularMoviesRequestModel) -> Single<PopularMoviesResponseModel>? {
        return repository.getPopularMovies(params: parameter)

    }
}

//public class BasicTokenUsecase2: SingleUseCase<BasicTokenRequestModel, LoginResponseModel> {
//
//    private let repository: BasicTokenOperationsRepositoryInterface!
//
//    public init(repository: BasicTokenOperationsRepositoryInterface) {
//        self.repository = repository
//    }
//    override func generateUseCase(parameter: BasicTokenRequestModel) -> Single<LoginResponseModel>? {
//        return repository.getBasicToken(params: parameter)
//    }
//}
