//
//  MovieDetailsPresenter.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 10.07.2022.
//

import Foundation

final class MovieDetailsPresenter {

    // MARK: - Private properties -

    private unowned let view: MovieDetailsViewInterface
    private let formatter: MovieDetailsFormatterInterface
    private let interactor: MovieDetailsInteractorInterface
    private let wireframe: MovieDetailsWireframeInterface

    // MARK: - Lifecycle -

    init(
        view: MovieDetailsViewInterface,
        formatter: MovieDetailsFormatterInterface,
        interactor: MovieDetailsInteractorInterface,
        wireframe: MovieDetailsWireframeInterface
    ) {
        self.view = view
        self.formatter = formatter
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension MovieDetailsPresenter: MovieDetailsPresenterInterface {
}
