//
//  GenericTableViewCell.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 10.07.2022.
//

import UIKit

class GenericTableViewCell<DataType, ViewType: DataBaseComponentView<DataType>>: BaseTableViewCell {
    
    lazy var genericView: ViewType = {
        let temp = ViewType()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func addMajorViews() {
        super.addMajorViews()
        
        contentView.addSubview(genericView)
        NSLayoutConstraint.activate([
            genericView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            genericView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            genericView.topAnchor.constraint(equalTo: contentView.topAnchor),
            genericView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    func setRowData(data: DataType) {
        genericView.setData(data: data)
    }
}
