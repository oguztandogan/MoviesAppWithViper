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
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = ColorAsset.persianPink.value
        collection.delegate = self
        collection.dataSource = self
        collection.isScrollEnabled = true
        collection.keyboardDismissMode = .onDrag
        collection.showsHorizontalScrollIndicator = false
        collection.genericRegisterCell(CollectionViewCell.self)
        collection.genericRegisterCell(LoadingCellView.self)
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
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 1200)
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
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            containerView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            
            movieDetailsComponent.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            movieDetailsComponent.topAnchor.constraint(equalTo: containerView.topAnchor),
            movieDetailsComponent.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            movieDetailsComponent.heightAnchor.constraint(equalToConstant: 550),

            castCollectionView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            castCollectionView.topAnchor.constraint(equalTo: movieDetailsComponent.bottomAnchor, constant: 25),
            castCollectionView.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            castCollectionView.heightAnchor.constraint(equalToConstant: 150),
            
            videoViewComponent.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            videoViewComponent.topAnchor.constraint(equalTo: castCollectionView.bottomAnchor, constant: 25),
            videoViewComponent.widthAnchor.constraint(equalTo: containerView.widthAnchor),
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
