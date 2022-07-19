//
//  GenericImageViewComponent.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 15.07.2022.
//

import Foundation
import UIKit

class ImageViewComponent: DataBaseComponentView<ImageViewComponentData> {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override func addMajorViews() {
        super.addMajorViews()
        addComponents()
    }
    
    private func addComponents() {
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    override func loadDataIntoViews() {
        super.loadDataIntoViews()
        guard let data = returnData() else {
            return
        }
        
        guard let imageUrlString = data.imageUrl else {
            imageView.image = data.image
            return
        }
        
        let imageUrl = URL(string: BaseImageUrl.imageUrl.value + imageUrlString)
        imageView.kf.setImage(with: imageUrl)
        imageView.layer.cornerRadius = data.cornerRadius ?? 0
    }
}
