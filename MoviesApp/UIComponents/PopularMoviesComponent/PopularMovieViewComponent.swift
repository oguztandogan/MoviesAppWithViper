//
//  PopularMoviesView.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 10.07.2022.
//

import UIKit
import Kingfisher

class PopularMovieViewComponent: DataBaseComponentView<PopularMovieViewComponentData> {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 6
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
        temp.textColor = .black
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
        temp.textColor = .black
        temp.lineBreakMode = .byWordWrapping
        temp.numberOfLines = 0
        temp.contentMode = .center
        temp.font = UIFont(name: "American Typewriter", size: 10)
        temp.textColor = ColorAsset.violetCrayola.value

        temp.textAlignment = .left
        return temp
    }()
    
    private lazy var movieRating: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textColor = .black
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
        stackView.addSubview(movieImageView)
        stackView.addSubview(movieTitle)
        stackView.addSubview(movieGenre)
        stackView.addSubview(movieRating)
        
        NSLayoutConstraint.activate([
            
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            
            movieImageView.topAnchor.constraint(equalTo: stackView.topAnchor),
            movieImageView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            movieImageView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            movieImageView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
            movieTitle.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 10),
            movieTitle.bottomAnchor.constraint(equalTo: movieRating.bottomAnchor, constant: -10),
            movieTitle.leadingAnchor.constraint(equalTo: movieImageView.leadingAnchor, constant: 10),
            
            movieGenre.centerYAnchor.constraint(equalTo: movieRating.centerYAnchor),
            movieGenre.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: -10),
            movieGenre.leadingAnchor.constraint(equalTo: movieImageView.leadingAnchor, constant: 10),
            movieGenre.trailingAnchor.constraint(equalTo: movieRating.trailingAnchor, constant: -20),
        ])
    }
    
    override func loadDataIntoViews() {
        super.loadDataIntoViews()
        
        guard let data = returnData(),
              let imageUrlString = data.movieImage?.absoluteString else { return }
        
        let imageUrl = URL(string: BaseImageUrl.imageUrl.value + imageUrlString)
        movieImageView.kf.setImage(with: imageUrl)
        movieTitle.text = data.movieTitleText
        movieGenre.text = data.movieGenreText
        movieRating.text = data.movieRatingText
    }
}
