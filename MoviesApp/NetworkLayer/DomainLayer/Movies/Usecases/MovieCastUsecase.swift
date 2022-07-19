//
//  MovieCastUsecase.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 18.07.2022.
//

import Foundation
import RxSwift

public class MovieCastUsecase: SingleUseCase<MovieCastRequestModel, MovieCastResponseModel, MoviesRepositoryInterface> {
    
    override func generateUseCase(parameter: MovieCastRequestModel, pathParameter: String?) -> Single<MovieCastResponseModel>? {
        return repository.getMovieCast(params: parameter, movieId: pathParameter ?? "")

    }
}
