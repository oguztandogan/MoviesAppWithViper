//
//  VideoComponent.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 18.07.2022.
//

import Foundation
import UIKit
import youtube_ios_player_helper

class VideoComponent: DataBaseComponentView<VideoComponentData> {
    
    private lazy var stackView: UIStackView = {
       let temp = UIStackView(arrangedSubviews: [videoName, videoView])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.spacing = 5
        temp.axis = .vertical
        return temp
    }()
    
    private lazy var videoName: UILabel = {
       let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.font = UIFont(name: "American Typewriter Bold", size: 20)
        temp.contentMode = .center
        return temp
    }()
    
    private lazy var videoView: YTPlayerView = {
        let videoView = YTPlayerView()
        videoView.translatesAutoresizingMaskIntoConstraints = false
        videoView.contentMode = .scaleAspectFit
        return videoView
    }()
    
    override func addMajorViews() {
        super.addMajorViews()
        addComponents()
    }
    
    private func addComponents() {
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
        ])
    }
    
    override func loadDataIntoViews() {
        super.loadDataIntoViews()
        guard let data = returnData() else { return }
        guard let videoKey = data.videoKey else {
            return
        }
        videoName.text = data.videoName
        videoView.load(withVideoId: videoKey, playerVars: ["playsinline": "1"])
    }
}
