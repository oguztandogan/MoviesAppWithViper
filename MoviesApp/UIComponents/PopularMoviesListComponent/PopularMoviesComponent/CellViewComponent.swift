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
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
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
    
    private lazy var movieGenre: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.lineBreakMode = .byWordWrapping
        temp.numberOfLines = 0
        temp.contentMode = .center
        temp.font = UIFont(name: "American Typewriter", size: 10)
        temp.textColor = ColorAsset.violetCrayola.value
        temp.text = "deneme"
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
        containerView.addSubview(stackView)
        containerView.addSubview(movieImageView)
        stackView.addSubview(movieTitle)
        stackView.addSubview(movieGenre)
        stackView.addSubview(movieRating)
        
        NSLayoutConstraint.activate([
            
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
            stackView.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            
            movieImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            movieImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            movieImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            movieImageView.widthAnchor.constraint(equalToConstant: 50),
            movieImageView.heightAnchor.constraint(equalToConstant: 85),
            
            movieTitle.topAnchor.constraint(equalTo: stackView.topAnchor),
            movieTitle.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            
            movieRating.trailingAnchor.constraint(equalTo: movieGenre.leadingAnchor, constant: -100),
            movieRating.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 5),
            movieRating.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: -5),
            
            movieGenre.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: -5),
            movieGenre.leadingAnchor.constraint(equalTo: movieRating.trailingAnchor, constant: 10),
        ])
    }
    
    override func loadDataIntoViews() {
        super.loadDataIntoViews()
        
        guard let data = returnData(),
              let imageUrlString = data.movieImage?.absoluteString else { return }
        
        let imageUrl = URL(string: BaseImageUrl.imageUrl.value + imageUrlString)
        movieImageView.kf.setImage(with: imageUrl)
        movieTitle.text = data.movieTitleText
        movieGenre.text = "deneme"
        movieRating.text = data.movieRatingText
    }
}
