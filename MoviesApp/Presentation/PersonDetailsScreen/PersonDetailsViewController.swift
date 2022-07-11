//
//  PersonDetailsViewController.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 10.07.2022.
//

import UIKit

final class PersonDetailsViewController: UIViewController {

    // MARK: - Public properties -

    var presenter: PersonDetailsPresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

// MARK: - Extensions -

extension PersonDetailsViewController: PersonDetailsViewInterface {
}
