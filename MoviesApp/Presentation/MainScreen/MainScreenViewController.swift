//
//  MainScreenViewController.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 10.07.2022.
//

import UIKit

final class MainScreenViewController: UIViewController {
    
    private var popularMoviesListComponent: PopularMoviesListComponent!

    // MARK: - Public properties -

    var presenter: MainScreenPresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        loadView()
        listenViewModelDataState()
    }
    
    override func loadView() {
        super.loadView()
        popularMoviesListComponent = PopularMoviesListComponent()
        popularMoviesListComponent.translatesAutoresizingMaskIntoConstraints = false
        popularMoviesListComponent.setupDelegation(with: presenter as! PopularMoviesListComponentDelegate)
        view.addSubview(popularMoviesListComponent)
        NSLayoutConstraint.activate([
            popularMoviesListComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            popularMoviesListComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            popularMoviesListComponent.topAnchor.constraint(equalTo: view.topAnchor),
            popularMoviesListComponent.bottomAnchor.constraint(equalTo: view.bottomAnchor)

        ])
    }
    
    private func listenViewModelDataState() {
        presenter.listenTableViewData { [weak self] (state) in
            switch state {
            case .done:
                self?.popularMoviesListComponent.reloadCollectionComponent()
            case .loading:
                break
            }
        }
    }

}

// MARK: - Extensions -

extension MainScreenViewController: MainScreenViewInterface {
}
