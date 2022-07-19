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
    
    private let scrollView = UIScrollView()
    private let containerView = UIView()
    
    private var personDetailsComponent: PersonDetailsViewComponent!
    
    private lazy var tableView: IntrinsicResizingTableView = {
        let tableView = IntrinsicResizingTableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        addScrollView()
        addPersonDetailsComponent()
        setPersonDetailsView()
        listenViewModelDataState()
    }
    
    override func loadView() {
        super.loadView()
        addMovieCreditsTableView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupConstraints()
    }
    
    private func addPersonDetailsComponent() {
        let data = presenter.getPersonDetailsComponentData()
        personDetailsComponent = PersonDetailsViewComponent(frame:.zero, data: data)
        personDetailsComponent.translatesAutoresizingMaskIntoConstraints = false
        personDetailsComponent.backgroundColor = ColorAsset.persianPink.value
        personDetailsComponent.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        containerView.addSubview(personDetailsComponent)
    }
    
    private func setPersonDetailsView() {
        presenter.listenPersonDetailsDataState { [weak self] data in
            self?.personDetailsComponent.setData(data: data)
        }
    }
    
    private func addMovieCreditsTableView() {
        containerView.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = ColorAsset.persianPink.value
        tableView.isScrollEnabled = false
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        tableView.estimatedRowHeight = 85
        tableView.rowHeight = 85
        tableView.invalidateIntrinsicContentSize()
        tableView.layoutIfNeeded()
        tableView.genericRegisterCell(PopularMoviesTableViewCellComponent.self)
    }
    
    private func addScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = ColorAsset.persianPink.value
        containerView.backgroundColor = ColorAsset.persianPink.value
        view.addSubview(scrollView)
        scrollView.isScrollEnabled = true
//        scrollView.contentSize = CGSize(width: self.view.frame.width, height: 2000)
        scrollView.addSubview(containerView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            personDetailsComponent.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            personDetailsComponent.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            personDetailsComponent.topAnchor.constraint(equalTo: containerView.topAnchor),
            personDetailsComponent.bottomAnchor.constraint(equalTo: tableView.topAnchor, constant: -25),
            
            tableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
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

extension PersonDetailsViewController: PersonDetailsViewInterface {
}


extension PersonDetailsViewController: UIScrollViewDelegate {
}

extension PersonDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getItemCount(section: section)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PopularMoviesTableViewCellComponent", for: indexPath) as? PopularMoviesTableViewCellComponent else { fatalError()
        }
        guard let data = presenter.getData(at: indexPath.row) else {
            return cell
        }
        cell.setRowData(data: data as! CellViewComponentData)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return presenter.getHeaderTitle()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.navigateToMovieDetailsScreen(index: indexPath.row)
    }
    
    
}

class IntrinsicResizingTableView: UITableView {

override var contentSize:CGSize {
    didSet {
        self.invalidateIntrinsicContentSize()
    }
}

override var intrinsicContentSize: CGSize {
    self.layoutIfNeeded()
    return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
}
}
