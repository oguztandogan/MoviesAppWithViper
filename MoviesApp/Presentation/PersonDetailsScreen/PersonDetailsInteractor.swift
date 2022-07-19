//
//  PersonDetailsInteractor.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 10.07.2022.
//

import Foundation

final class PersonDetailsInteractor: AssemblerWireframeInteractorProtocol {
    private var personDetailsUsecase: PersonDetailsUsecase?
    private var movieCreditsUsecase: MovieCreditsUsecase?

}

// MARK: - Extensions -

extension PersonDetailsInteractor: PersonDetailsInteractorInterface {
    func fetchPersonDetails(callback: PersonDetailsCallback, params: PersonDetailsRequestModel, personId: String) {
        self.personDetailsUsecase = self.returnResolver().resolve(PersonDetailsUsecase.self)
        self.personDetailsUsecase?.execute(useCaseCallBack: callback, params: PersonDetailsRequestModel(), pathParameter: personId)
    }
    
    func fetchMovieCredits(callback: MovieCreditsCallback, params: MovieCreditsRequestModel, personId: String) {
        self.movieCreditsUsecase = self.returnResolver().resolve(MovieCreditsUsecase.self)
        self.movieCreditsUsecase?.execute(useCaseCallBack: callback, params: MovieCreditsRequestModel(), pathParameter: personId)
    }
    
}
