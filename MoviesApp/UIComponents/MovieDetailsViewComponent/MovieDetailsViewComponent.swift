//
//  MovieDetailsViewComponent.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 17.07.2022.
//

import Foundation
import UIKit

class MovieDetailsViewComponent: DataBaseComponentView<MovieDetailsViewComponentData> {
    
    private lazy var containerView: UIView = {
       let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var movieTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.lineBreakMode = .byWordWrapping
        title.font = UIFont(name: "American Typewriter Bold", size: 22)
        title.isHighlighted = true
        title.textColor = ColorAsset.russianViolet.value
        title.numberOfLines = 0
        title.textAlignment = .left
        return title
    }()
    
    private lazy var summary: UILabel = {
        let summary = UILabel()
        summary.translatesAutoresizingMaskIntoConstraints = false
        summary.lineBreakMode = .byWordWrapping
        summary.font = UIFont(name: "American Typewriter", size: 18)
        summary.textColor = ColorAsset.russianViolet.value
        summary.numberOfLines = 0
        summary.textAlignment = .left
        return summary
    }()
    
    private lazy var ratingLabel: UILabel = {
        let rating = UILabel()
        rating.translatesAutoresizingMaskIntoConstraints = false
        rating.font = UIFont(name: "American Typewriter Bold", size: 18)
        rating.textColor = ColorAsset.russianViolet.value
        rating.numberOfLines = 0
        rating.text = "Rating: "
        rating.textAlignment = .left
        return rating
    }()
    
    private lazy var ratingAverage: UILabel = {
        let rating = UILabel()
        rating.translatesAutoresizingMaskIntoConstraints = false
        rating.lineBreakMode = .byWordWrapping
        rating.font = UIFont(name: "American Typewriter", size: 18)
        rating.textColor = ColorAsset.russianViolet.value
        rating.numberOfLines = 0
        rating.textAlignment = .left
        return rating
    }()
    
    override func addMajorViews() {
        super.addMajorViews()
        addComponents()
    }
    
    private func addComponents() {
        addSubview(containerView)
        containerView.addSubview(imageView)
        containerView.addSubview(movieTitle)
        containerView.addSubview(summary)
        containerView.addSubview(ratingAverage)
        containerView.addSubview(ratingLabel)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: movieTitle.topAnchor, constant: -10),
            imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            movieTitle.bottomAnchor.constraint(equalTo: summary.topAnchor, constant: -10),
            movieTitle.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            
            summary.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            summary.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            summary.bottomAnchor.constraint(equalTo: ratingAverage.topAnchor, constant: -10),
            
            ratingAverage.leadingAnchor.constraint(equalTo: ratingLabel.trailingAnchor, constant: 5),
            
            ratingLabel.centerYAnchor.constraint(equalTo: ratingAverage.centerYAnchor),
            ratingLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            ratingLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
    
    override func loadDataIntoViews() {
        super.loadDataIntoViews()
        guard let data = returnData(),
              let imageUrlString = data.imageViewData else { return }
        
        let imageUrl = URL(string: BaseImageUrl.imageUrl.value + imageUrlString)
        imageView.kf.setImage(with: imageUrl)
        movieTitle.text = data.movieTitle
        summary.text = data.summary
        ratingAverage.text = data.rating
    }
}
