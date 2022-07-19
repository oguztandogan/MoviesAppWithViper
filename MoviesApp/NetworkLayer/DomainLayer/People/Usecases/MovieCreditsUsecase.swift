//
//  MovieCreditsUsecase.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 15.07.2022.
//

import Foundation
import RxSwift

public class MovieCreditsUsecase: SingleUseCase<MovieCreditsRequestModel, MovieCreditsResponseModel, PeopleRepositoryInterface> {
    
    override func generateUseCase(parameter: MovieCreditsRequestModel, pathParameter: String?) -> Single<MovieCreditsResponseModel>? {
        return repository.getMovieCredits(params: parameter, personId: pathParameter ?? "")
    }
}
