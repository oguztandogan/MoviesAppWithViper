//
//  LottieAnimationComponent.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 14.07.2022.
//

import Foundation
import UIKit
import Lottie

class LottieAnimationComponent: DataBaseComponentView<LottieAnimationComponentData> {
    
    private weak var delegate: LottieAnimationComponentDelegate?
    
    
//    let disposeBag = DisposeBag()
    
    private lazy var animationView: AnimationView = {
        let animationView = AnimationView(name: LottieAnimations.movieCameraAnimation.value)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.clipsToBounds = true
//        animationView = .init(name: LottieAnimations.movieCameraAnimation.value)
        animationView.contentMode = .scaleToFill
        animationView.loopMode = .autoReverse
        return animationView
    }()
    func setupDelegation(with delegate: LottieAnimationComponentDelegate) {
        self.delegate = delegate
    }
    
    override func addMajorViews() {
        super.addMajorViews()
        addComponents()
    }
    
    private func addComponents() {
        addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.topAnchor.constraint(equalTo: topAnchor),
            animationView.bottomAnchor.constraint(equalTo: bottomAnchor),
            animationView.leadingAnchor.constraint(equalTo: leadingAnchor),
            animationView.trailingAnchor.constraint(equalTo: trailingAnchor)
            
            
        ])
    }
    
    override func loadDataIntoViews() {
        super.loadDataIntoViews()
        guard let data = returnData() else { return }
//        animationView = .init(name: data.animation.value)
        animationView.animationSpeed = data.animationSpeed ?? 1
        animationView.play()
    }
}
