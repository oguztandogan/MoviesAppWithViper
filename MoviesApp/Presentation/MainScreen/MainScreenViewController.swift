//
//  MainScreenViewController.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 10.07.2022.
//

import UIKit

final class MainScreenViewController: UIViewController {
        
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.genericRegisterCell(LoadingCellView.self)
        tableView.genericRegisterCell(PopularMoviesTableViewCellComponent.self)
        return tableView
    }()
    

    // MARK: - Public properties -

    var presenter: MainScreenPresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
//    override func loadView() {
//        super.loadView()
//        view.addSubview(tableView)
//        NSLayoutConstraint.activate([
//            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            tableView.topAnchor.constraint(equalTo: view.topAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        
//        ])
//    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addPopularMoviesTableView()
    }
    
    private func addPopularMoviesTableView() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        ])
    }

}

// MARK: - Extensions -

extension MainScreenViewController: MainScreenViewInterface {
}

extension MainScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PopularMoviesTableViewCellComponent.identifier, for: indexPath) as? PopularMoviesTableViewCellComponent else { fatalError() }
        cell.setRowData(data: presenter.fetchRowData(index: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
}
