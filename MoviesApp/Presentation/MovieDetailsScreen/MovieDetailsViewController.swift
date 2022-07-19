//
//  MovieDetailsViewController.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 10.07.2022.
//

import UIKit
import SwiftUI

final class MovieDetailsViewController: BaseViewController, UIScrollViewDelegate {
    
    // MARK: - Public properties -
    
    var presenter: MovieDetailsPresenterInterface!
    
    private var movieDetailsComponent: MovieDetailsViewComponent!

    private let scrollView = UIScrollView()
    private let containerView = UIView()
    
    private var videoViewComponent: VideoComponent!
    
    private lazy var castCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0.0
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = ColorAsset.persianPink.value
        collection.delegate = self
        collection.dataSource = self
        collection.isScrollEnabled = true
        collection.showsHorizontalScrollIndicator = false
        collection.genericRegisterCell(CollectionViewCell.self)
        return collection
    }()
    
    // MARK: - Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        addScrollView()
        addCastCollectionView()
        listenViewModelDataState()
        addMovieDetailsComponent()
        addVideoView()
        setVideoView()
        setMovieDetailsView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupConstraints()
    }
    
    private func addCastCollectionView() {
        containerView.addSubview(castCollectionView)
    }
    
    func addMovieDetailsComponent() {
        let data = presenter.getMovieDetailsComponentData()
        movieDetailsComponent = MovieDetailsViewComponent(data: data)
        movieDetailsComponent.translatesAutoresizingMaskIntoConstraints = false
        movieDetailsComponent.backgroundColor = ColorAsset.persianPink.value
        containerView.addSubview(movieDetailsComponent)
    }
    
    private func addScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = ColorAsset.persianPink.value
        containerView.backgroundColor = ColorAsset.persianPink.value
        view.backgroundColor = ColorAsset.persianPink.value
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
    }
    
    func addVideoView() {
        let data = presenter.getVideoComponentData()
        videoViewComponent = VideoComponent(data: data)
        videoViewComponent.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(videoViewComponent)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            movieDetailsComponent.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            movieDetailsComponent.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            movieDetailsComponent.topAnchor.constraint(equalTo: containerView.topAnchor),
            movieDetailsComponent.bottomAnchor.constraint(equalTo: castCollectionView.topAnchor, constant: -25),

            castCollectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            castCollectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            castCollectionView.heightAnchor.constraint(equalToConstant: 150),
            castCollectionView.bottomAnchor.constraint(equalTo: videoViewComponent.topAnchor, constant: -20),
            
            videoViewComponent.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            videoViewComponent.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            videoViewComponent.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            videoViewComponent.heightAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 9/16),

        ])
    }
    
    private func listenViewModelDataState() {
        
        presenter.listenCollectionState { [weak self] (state) in
            switch state {
            case .done:
                self?.castCollectionView.reloadData()
            case .loading:
                break
            case .searching:
                break
            }
        }
    }
    private func setMovieDetailsView() {
        presenter.listenMovieDetailsDataState { [weak self] data in
            self?.movieDetailsComponent.setData(data: data)
        }
    }
    
    private func setVideoView() {
        presenter.listenVideoDataState{ [weak self] data in
            self?.videoViewComponent.setData(data: data)
        }
    }
    
}

// MARK: - Extensions -

extension MovieDetailsViewController: MovieDetailsViewInterface {
    
  
    
    

}

extension MovieDetailsViewController: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.getItemCount() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else { fatalError() }
        cell.setRowData(data: presenter?.getData(index: indexPath.row) as? CollectionViewCellViewComponentData)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didSelectItemAt(index: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
}
