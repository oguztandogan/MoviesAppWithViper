//
//  LottieViewController.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 14.07.2022.
//

import UIKit
import Lottie

class LottieViewController: UIViewController {

    // MARK: - Required Properties -
    private var name: LottieAnimations!
    private var loopMode: LottieLoopMode!
    
    private lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        return temp
    }()
    
    private lazy var animationView: AnimationView = {
        let temp = AnimationView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.animation = Animation.named(name.value)
        temp.contentMode = .scaleAspectFit
        temp.loopMode = loopMode
        return temp
    }()
    
    convenience init(name: LottieAnimations, loopMode: LottieLoopMode = .loop) {
        self.init()
        self.name = name
        self.loopMode = loopMode
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appendAnimationView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        runAnimation()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        stopAnimation()
    }
    
    private func appendAnimationView() {
        view.addSubview(containerView)
        containerView.addSubview(animationView)
        
        NSLayoutConstraint.activate([
        
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: -view.safeAreaInsets.top),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: view.safeAreaInsets.bottom),

            animationView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            animationView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            animationView.heightAnchor.constraint(equalToConstant: 200),
            animationView.widthAnchor.constraint(equalToConstant: 200)
            
        ])
    }
    
    func runAnimation() {
        DispatchQueue.main.async { [weak self] in
            self?.animationView.play()
        }
    }
    
    func stopAnimation() {
        DispatchQueue.main.async { [weak self] in
            self?.animationView.stop()
        }
    }
    
    func animationOperationKiller(with completion: (() -> Void)?) {
        dismiss(animated: true, completion: completion)
    }
    
}
