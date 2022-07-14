//
//  MainScreenViewController.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 10.07.2022.
//

import UIKit

final class MainScreenViewController: UIViewController {
    
    private var searchBarComponent: SearchBarComponent!
    private var lottieAnimationComponent: LottieAnimationComponent!
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var array = [["asdfasdfa","asdfasdfasd"],["1234123", "12341234123"]]
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
//        addLottieAnimationComponent()
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
    
    private func addLottieAnimationComponent() {
        lottieAnimationComponent = LottieAnimationComponent(frame: .zero, data: presenter.getLottieAnimationComponentData())
        lottieAnimationComponent.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lottieAnimationComponent)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: searchBarComponent.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            searchBarComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBarComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchBarComponent.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
//            lottieAnimationComponent.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            lottieAnimationComponent.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            lottieAnimationComponent.widthAnchor.constraint(equalToConstant: 100),
//            lottieAnimationComponent.heightAnchor.constraint(equalToConstant: 100)

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
        print("sections: \(section)")
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
    
    
    
}
