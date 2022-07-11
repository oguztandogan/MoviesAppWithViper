//
//  MovieDetailsViewController.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 10.07.2022.
//

import UIKit

final class MovieDetailsViewController: UIViewController {

    // MARK: - Public properties -

    var presenter: MovieDetailsPresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

// MARK: - Extensions -

extension MovieDetailsViewController: MovieDetailsViewInterface {
}
