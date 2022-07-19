//
//  KnownForCollectionCellViewComponent.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 15.07.2022.
//

import Foundation
import UIKit

class CollectionViewCellViewComponent: DataBaseComponentView<CollectionViewCellViewComponentData> {
    
    private lazy var roundedImage: UIImageView = {
        let temp = UIImageView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.clipsToBounds = true
        temp.layer.masksToBounds = false
        temp.contentMode = .scaleAspectFit
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
        addSubview(roundedImage)
        addSubview(title)
        backgroundColor = ColorAsset.violetCrayola.value
        NSLayoutConstraint.activate([

            roundedImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            roundedImage.bottomAnchor.constraint(equalTo: title.topAnchor),
            roundedImage.heightAnchor.constraint(equalToConstant: 100),
            roundedImage.widthAnchor.constraint(equalToConstant: 85),

            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.bottomAnchor.constraint(equalTo: bottomAnchor),

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
