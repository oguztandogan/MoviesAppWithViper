//
//  GenericCollectionViewCell.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 15.07.2022.
//

import UIKit

class GenericCollectionViewCell<DataType, ViewType: DataBaseComponentView<DataType>>: BaseCollectionViewCell {
    
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
    
    func setRowData(data: DataType?) {
        genericView.setData(data: data)
    }
    
    //    func subscribeToSelectedRow(completion: @escaping GenericComponentDataProtocolCompletion) {
    //        genericView.startPressedAnimationCommon { [weak self](finish) in
    //            if finish {
    //                guard let data = self?.genericView.returnData() as? GenericComponentDataProtocol else { return }
    //                completion(data)
    //            }
    //        }
    //    }
    
}
