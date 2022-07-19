//
//  MovieDetailsWireframe.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 10.07.2022.
//

import UIKit

final class MovieDetailsWireframe: BaseWireframe<MovieDetailsViewController> {

    // MARK: - Private properties -

    // MARK: - Module setup -

    init(movieId: String?) {
        let moduleViewController = MovieDetailsViewController()
        super.init(viewController: moduleViewController)

        let formatter = MovieDetailsFormatter()
        let interactor = MovieDetailsInteractor()
        let presenter = MovieDetailsPresenter(view: moduleViewController, formatter: formatter, interactor: interactor, wireframe: self, movieId: movieId)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension MovieDetailsWireframe: MovieDetailsWireframeInterface {
    func navigate(option: MovieDetailsNavigationOptions) {
        switch option {
        case .personDetails(let personId):
            presentPersonDetails(personId: personId)
        }
    }
    
    private func presentPersonDetails(personId: String?) {
        navigationController?.pushWireframe(PersonDetailsWireframe(personId: personId))
    }
}
