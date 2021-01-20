//
//  AppDetailHeaderView.swift
//  iOSArchitecturesDemo
//
//  Created by Veaceslav Chirita on 17.11.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

class SongDetailHeaderView: UIView {
    
    private(set) lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 30.0
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.numberOfLines = 2
        return label
    }()
    
    private(set) lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14.0)
        return label
    }()
    
    private(set) lazy var albumLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setUI() {
        self.addSubview(imageView)
        self.addSubview(titleLabel)
        self.addSubview(authorLabel)
        self.addSubview(albumLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12.0),
            imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16.0),
            imageView.heightAnchor.constraint(equalToConstant: 120.0),
            imageView.widthAnchor.constraint(equalToConstant: 120.0),
            
            authorLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12.0),
            authorLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 16.0),
            authorLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16.0),
            
            titleLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 12.0),
            titleLabel.leftAnchor.constraint(equalTo: authorLabel.leftAnchor),
            titleLabel.rightAnchor.constraint(equalTo: authorLabel.rightAnchor),
            
            albumLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 24.0),
            albumLabel.leftAnchor.constraint(equalTo: imageView.leftAnchor),
            albumLabel.rightAnchor.constraint(equalTo: authorLabel.rightAnchor),
            albumLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
}
