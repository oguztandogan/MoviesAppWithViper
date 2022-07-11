//
//  MainScreenWireframe.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 10.07.2022.
//

import UIKit

final class MainScreenWireframe: BaseWireframe<MainScreenViewController> {

    // MARK: - Private properties -

    // MARK: - Module setup -

    init() {
        let moduleViewController = MainScreenViewController()
        super.init(viewController: moduleViewController)

        let formatter = MainScreenFormatter()
        let interactor = MainScreenInteractor()
        let presenter = MainScreenPresenter(view: moduleViewController, formatter: formatter, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension MainScreenWireframe: MainScreenWireframeInterface {
}
