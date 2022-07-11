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

    init() {
        let moduleViewController = MovieDetailsViewController()
        super.init(viewController: moduleViewController)

        let formatter = MovieDetailsFormatter()
        let interactor = MovieDetailsInteractor()
        let presenter = MovieDetailsPresenter(view: moduleViewController, formatter: formatter, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension MovieDetailsWireframe: MovieDetailsWireframeInterface {
}
