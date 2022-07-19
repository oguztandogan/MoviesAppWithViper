//
//  MainScreenViewController.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 10.07.2022.
//

import UIKit

final class MainScreenViewController: BaseViewController {
    
    private var searchBarComponent: SearchBarComponent!
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Public properties -
    
    var presenter: MainScreenPresenterInterface!
    
    // MARK: - Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        listenViewModelDataState()
    }
    
    override func loadView() {
        super.loadView()
        addPopularMoviesTableView()
        addSearchBar()
        setupConstraints()
        tableView.reloadData()
    }
    
    private func addPopularMoviesTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = ColorAsset.persianPink.value
        tableView.keyboardDismissMode = .onDrag
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        
        tableView.separatorStyle = .none
        tableView.genericRegisterCell(PopularMoviesTableViewCellComponent.self)
    }
    
    private func addSearchBar() {
        searchBarComponent = SearchBarComponent()
        searchBarComponent.translatesAutoresizingMaskIntoConstraints = false
        searchBarComponent.backgroundColor = .clear
        searchBarComponent.setupDelegation(with: presenter as! SearchBarComponentDelegate)
        view.addSubview(searchBarComponent)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: searchBarComponent.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            searchBarComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBarComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchBarComponent.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
    
    private func listenViewModelDataState() {
        presenter.listenTableViewData { [weak self] (state) in
            switch state {
            case .done:
                self?.tableView.reloadData()
            case .searching:
                self?.tableView.reloadData()
            case .loading:
                break
            }
        }
    }
    
}

// MARK: - Extensions -

extension MainScreenViewController: MainScreenViewInterface {
}

extension MainScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getItemCount(section: section)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PopularMoviesTableViewCellComponent", for: indexPath) as? PopularMoviesTableViewCellComponent else { fatalError()
        }
        guard let data = presenter.getData(at: indexPath.row, section: indexPath.section) else {
            return cell
        }
        cell.setRowData(data: data as! CellViewComponentData)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfSections()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        presenter.getHeaderTitle(section: section)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.navigateToMovieDetailsScreen(index: indexPath.row)
    }
    
    
    
}
