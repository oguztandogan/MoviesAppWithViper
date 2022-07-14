//
//  SearchBarComponent.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 12.07.2022.
//

import Foundation
import UIKit
import RxSwift

class SearchBarComponent: DataBaseComponentView<SearchBarComponentData> {
    
    private weak var delegate: SearchBarComponentDelegate?
    
    private var pendingRequestWorkItem: DispatchWorkItem?
    
//    let disposeBag = DisposeBag()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.clipsToBounds = true
        searchBar.keyboardAppearance = .default
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        return searchBar
    }()
    func setupDelegation(with delegate: SearchBarComponentDelegate) {
        self.delegate = delegate
    }
    
    override func addMajorViews() {
        super.addMajorViews()
        addComponents()
    }
    
    private func addComponents() {
        addSubview(searchBar)
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: topAnchor),
            searchBar.bottomAnchor.constraint(equalTo: bottomAnchor),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    override func loadDataIntoViews() {
        super.loadDataIntoViews()

    }
}

extension SearchBarComponent: UISearchBarDelegate {
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        pendingRequestWorkItem?.cancel()
        
        let requestWorkItem = DispatchWorkItem { [weak self] in
            self?.delegate?.getSearchBarText(searchText: searchText)
        }
        pendingRequestWorkItem = requestWorkItem
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(250),
                                      execute: requestWorkItem)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        delegate?.textBeginEditing(didSearchBarTapped: true)
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        delegate?.textFinishedEditing()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        delegate?.cancelButtonClicked()
        
    }
    
}
