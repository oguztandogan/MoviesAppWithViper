//
//  PersonDetailsViewComponent.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 15.07.2022.
//

import Foundation
import UIKit

class PersonDetailsViewComponent: DataBaseComponentView<PersonDetailsViewComponentData> {
    
    private lazy var profilePicture: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var personName: UILabel = {
        let personName = UILabel()
        personName.translatesAutoresizingMaskIntoConstraints = false
        personName.font = UIFont(name: "American Typewriter Bold", size: 20)
        personName.numberOfLines = 0
        return personName
    }()
    
    private lazy var biographyLabel: UILabel = {
        let biographyLabel = UILabel()
        biographyLabel.translatesAutoresizingMaskIntoConstraints = false
        biographyLabel.font = UIFont(name: "American Typewriter", size: 16)
        biographyLabel.numberOfLines = 0
        return biographyLabel
    }()
    
    override func addMajorViews() {
        super.addMajorViews()
        addComponents()
    }
    
    private func addComponents() {
        addSubview(profilePicture)
        addSubview(personName)
        addSubview(biographyLabel)
        
        NSLayoutConstraint.activate([
            profilePicture.topAnchor.constraint(equalTo: topAnchor),
            profilePicture.bottomAnchor.constraint(equalTo: personName.topAnchor, constant: -15),
            profilePicture.leadingAnchor.constraint(equalTo: leadingAnchor),
            profilePicture.trailingAnchor.constraint(equalTo: trailingAnchor),
            profilePicture.heightAnchor.constraint(equalToConstant: 200),

            
            personName.bottomAnchor.constraint(equalTo: biographyLabel.topAnchor, constant: -15),
            personName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            biographyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            biographyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
        ])
    }
    
    override func loadDataIntoViews() {
        super.loadDataIntoViews()
        guard let data = returnData(),
              let imageUrlString = data.profilePictureUrl else {
            return
        }
        let imageUrl = URL(string: BaseImageUrl.imageUrl.value + imageUrlString)
        profilePicture.kf.setImage(with: imageUrl)
        personName.text = data.personName
        biographyLabel.text = data.biographyText
    }
}
