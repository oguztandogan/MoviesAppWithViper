//
//  PersonDetailsPresenter.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 10.07.2022.
//

import Foundation

final class PersonDetailsPresenter {

    // MARK: - Private properties -

    private unowned let view: PersonDetailsViewInterface
    private let formatter: PersonDetailsFormatterInterface
    private let interactor: PersonDetailsInteractorInterface
    private let wireframe: PersonDetailsWireframeInterface

    // MARK: - Lifecycle -

    init(
        view: PersonDetailsViewInterface,
        formatter: PersonDetailsFormatterInterface,
        interactor: PersonDetailsInteractorInterface,
        wireframe: PersonDetailsWireframeInterface
    ) {
        self.view = view
        self.formatter = formatter
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension PersonDetailsPresenter: PersonDetailsPresenterInterface {
}
