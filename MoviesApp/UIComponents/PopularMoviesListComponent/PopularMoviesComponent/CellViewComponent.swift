//
//  PopularMoviesView.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 10.07.2022.
//

import UIKit
import Kingfisher

class CellViewComponent: DataBaseComponentView<CellViewComponentData> {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var movieImageView: UIImageView = {
        let temp = UIImageView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.contentMode = .scaleAspectFit
        return temp
    }()
    
    private lazy var movieTitle: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.lineBreakMode = .byWordWrapping
        temp.font = UIFont(name: "American Typewriter", size: 14)
        temp.textColor = ColorAsset.violetCrayola.value
        temp.numberOfLines = 0
        temp.contentMode = .center
        temp.textAlignment = .left
        return temp
    }()
    
    private lazy var movieRating: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.lineBreakMode = .byWordWrapping
        temp.numberOfLines = 0
        temp.contentMode = .center
        temp.font = UIFont(name: "American Typewriter", size: 10)
        temp.textColor = ColorAsset.violetCrayola.value
        temp.textAlignment = .left
        return temp
    }()
    
    override func addMajorViews() {
        super.addMajorViews()
        addComponents()
    }
    
    private func addComponents() {
        addSubview(containerView)
        containerView.addSubview(movieImageView)
        containerView.addSubview(movieTitle)
        containerView.addSubview(movieRating)
        
        NSLayoutConstraint.activate([
            
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            
            movieImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            movieImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            movieImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            movieImageView.widthAnchor.constraint(equalToConstant: 50),
            
            movieTitle.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            movieTitle.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 10),
            
            movieRating.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
            movieRating.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 10),

        ])
    }
    
    override func loadDataIntoViews() {
        super.loadDataIntoViews()
        
        guard let data = returnData(),
              let imageUrlString = data.movieImage?.absoluteString else { return }
        
        let imageUrl = URL(string: BaseImageUrl.imageUrl.value + imageUrlString)
        movieImageView.kf.setImage(with: imageUrl)
        movieTitle.text = data.movieTitleText
        movieRating.text = data.movieRatingText
    }
}
