//
//  PopularMoviesListComponent.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 10.07.2022.
//

import UIKit

class PopularMoviesListComponent: DataBaseComponentView<PopularMoviesListComponentData> {
    
    private weak var delegate: PopularMoviesListComponentDelegate?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.keyboardDismissMode = .onDrag
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.genericRegisterCell(PopularMoviesTableViewCellComponent.self)
        tableView.genericRegisterCell(LoadingCellView.self)
        return tableView
    }()
    
    private lazy var pullToRefresh: UIRefreshControl = {
        let temp = UIRefreshControl()
        temp.addTarget(self, action: .pullToRefreshAction, for: .valueChanged)
        return temp
    }()
    
    override func setupView() {
        super.setupView()
        addPullToRefresh()
    }
    
    
    override func addMajorViews() {
        super.addMajorViews()
        addCollectionView()
    }
    
    private func addCollectionView() {
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
        
    }
    
    func addPullToRefresh() {
        guard let data = returnData() else { return }
        tableView.refreshControl = pullToRefresh
    }
    
    func setupDelegation(with delegate: PopularMoviesListComponentDelegate) {
        self.delegate = delegate
    }
    
    func reloadCollectionComponent() {
        DispatchQueue.main.async { [weak self] in
            self?.pullToRefresh.endRefreshing()
            self?.tableView.reloadData()
        }
    }
    
    func isLoadingCell(for indexPath: IndexPath) -> Bool {
        return delegate?.isLoadingCell(for: indexPath.row) ?? false
    }
    
    @objc fileprivate func pullToRefreshAction(_ sender: UIRefreshControl) {
        pullToRefresh.beginRefreshing()
        guard pullToRefresh.isRefreshing else { return }
        delegate?.refreshCollectionView()
    }
    
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource -
extension PopularMoviesListComponent: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate?.getNumberOfSection() ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if isLoadingCell(for: indexPath) {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LoadingCellView.identifier, for: indexPath) as? LoadingCellView else { fatalError() }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PopularMoviesTableViewCellComponent.identifier, for: indexPath) as? PopularMoviesTableViewCellComponent else { fatalError() }
            cell.setRowData(data: delegate?.getData(at: indexPath.row) as! PopularMovieViewComponentData)
            return cell
        }
    }
}


// MARK: - Selector
fileprivate extension Selector {
    static let pullToRefreshAction = #selector(PopularMoviesListComponent.pullToRefreshAction)
}
