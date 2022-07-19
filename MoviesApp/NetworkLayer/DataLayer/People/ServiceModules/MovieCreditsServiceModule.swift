//
//  MovieCreditsServiceModule.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 15.07.2022.
//

import Foundation

public class MovieCreditsServiceModule: ApiServiceProvider<MovieCreditsRequestModel> {
    
    init(request: MovieCreditsRequestModel, personId: String) {
        super.init(method: .get, path: PeoplePaths.movieCredits(personId).value, pathType: .tmdbBaseUrl, isAuthRequested: false, data: request)
    }
}
