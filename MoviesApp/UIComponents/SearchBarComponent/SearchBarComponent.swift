//
//  SearchBarComponent.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 12.07.2022.
//

import Foundation
import UIKit

class SearchBarComponent: DataBaseComponentView<SearchBarComponentData> {
    
    private weak var delegate: SearchBarComponentDelegate?
    
    private var pendingRequestWorkItem: DispatchWorkItem?
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.clipsToBounds = true
        searchBar.keyboardAppearance = .default
        searchBar.delegate = self
        searchBar.showsCancelButton = false
        searchBar.backgroundColor = ColorAsset.russianViolet.value
        searchBar.tintColor = ColorAsset.russianViolet.value
        searchBar.barTintColor =  ColorAsset.persianPink.value
        searchBar.placeholder = "Enter movie or person name"
        let textFieldInsideUISearchBar = searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideUISearchBar?.textColor = .darkGray
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).setTitleTextAttributes([NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): UIColor.darkGray], for: .normal)
        let labelInsideUISearchBar = textFieldInsideUISearchBar!.value(forKey: "placeholderLabel") as? UILabel
        labelInsideUISearchBar?.textColor = .gray
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

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.text = ""
        searchBar.endEditing(true)
        searchBar.showsCancelButton = false
        delegate?.cancelButtonClicked()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        delegate?.textBeginEditing(didSearchBarTapped: true)
        searchBar.showsCancelButton = true

    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        delegate?.textFinishedEditing()
//        searchBar.showsCancelButton = true
    }
}

