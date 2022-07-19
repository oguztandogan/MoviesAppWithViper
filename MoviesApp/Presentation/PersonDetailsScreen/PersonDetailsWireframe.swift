//
//  PersonDetailsWireframe.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 10.07.2022.
//

import UIKit

final class PersonDetailsWireframe: BaseWireframe<PersonDetailsViewController> {

    // MARK: - Private properties -

    // MARK: - Module setup -

    init(personId: String?) {
        let moduleViewController = PersonDetailsViewController()
        super.init(viewController: moduleViewController)

        let formatter = PersonDetailsFormatter()
        let interactor = PersonDetailsInteractor()
        let presenter = PersonDetailsPresenter(personId: personId, view: moduleViewController, formatter: formatter, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension PersonDetailsWireframe: PersonDetailsWireframeInterface {
    func navigate(option: PersonDetailsNavigationOptions) {
        switch option {
        case .movieDetails(let movieId):
            presentMovieDetails(movieId: movieId)
        }
    }
    
    private func presentMovieDetails(movieId: String?) {
        navigationController?.pushWireframe(MovieDetailsWireframe(movieId: movieId))
    }
}
