//
//  KnownForCollectionCellViewComponent.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 15.07.2022.
//

import Foundation
import UIKit

class CollectionViewCellViewComponent: DataBaseComponentView<CollectionViewCellViewComponentData> {
    
    private lazy var containerView: UIView = {
       let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var roundedImage: UIImageView = {
        let temp = UIImageView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.clipsToBounds = true
        temp.contentMode = .scaleToFill
        temp.layer.cornerRadius = 45
        return temp
    }()
    
    private lazy var title: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.font = UIFont(name: "American Typewriter", size: 12)
        temp.textColor = .white
        temp.contentMode = .top
        temp.textAlignment = .left
        return temp
    }()
    
    override func addMajorViews() {
        super.addMajorViews()
        addComponents()
    }
    
    private func addComponents() {
        addSubview(containerView)
        containerView.addSubview(roundedImage)
        containerView.addSubview(title)
        backgroundColor = ColorAsset.violetCrayola.value
        layer.cornerRadius = 40
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),

            roundedImage.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            roundedImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            roundedImage.bottomAnchor.constraint(equalTo: title.topAnchor, constant: -5),
            roundedImage.bottomAnchor.constraint(equalTo: title.topAnchor, constant: -5),

            roundedImage.heightAnchor.constraint(equalToConstant: 100),
            roundedImage.widthAnchor.constraint(equalToConstant: 100),

            title.centerXAnchor.constraint(equalTo: centerXAnchor),

        ])
    }

    override func loadDataIntoViews() {
        super.loadDataIntoViews()
        guard let data = returnData() else { return }
        guard let imageUrlString = data.roundedImageData else {
            return
        }
        
        let imageUrl = URL(string: BaseImageUrl.imageUrl.value + imageUrlString)
        roundedImage.kf.setImage(with: imageUrl)
        title.text = data.titleText
    }
    
}
