//
//  AppCell.swift
//  iOSArchitecturesDemo
//
//  Created by Evgeny Kireev on 01/03/2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import UIKit

final class SongCell: UITableViewCell {
    
    // MARK: - Subviews
    private(set) lazy var iconImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16.0)
        return label
    }()
    
    private(set) lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 13.0)
        return label
    }()
    
    private(set) lazy var albumLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 12.0)
        return label
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }
    
    // MARK: - Methods
    
    func configure(with cellModel: SongCellModel) {
        self.titleLabel.text = cellModel.title
        self.authorLabel.text = cellModel.author
        self.albumLabel.text = cellModel.album
        self.iconImage.image = UIImage(named: "search_song")?.resized(to: CGSize(width: 40, height: 40))
    }
    
    // MARK: - UI
    
    override func prepareForReuse() {
        [self.titleLabel, self.authorLabel, self.albumLabel].forEach { $0.text = nil }
    }
    
    private func configureUI() {
        self.addIconView()
        self.addTitleLabel()
        self.addAuthorLabel()
        self.addAlbumLabel()
    }
    
    private func addIconView() {
        self.contentView.addSubview(self.iconImage)
        NSLayoutConstraint.activate([
            self.iconImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8.0),
            self.iconImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12.0),
            self.iconImage.heightAnchor.constraint(equalToConstant: 40.0),
            self.iconImage.widthAnchor.constraint(equalToConstant: 40.0),
            ])
    }

    private func addTitleLabel() {
        self.contentView.addSubview(self.titleLabel)
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8.0),
            self.titleLabel.leftAnchor.constraint(equalTo: self.iconImage.rightAnchor, constant: 12.0),
            self.titleLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
            ])
    }
    
    private func addAuthorLabel() {
        self.contentView.addSubview(self.authorLabel)
        NSLayoutConstraint.activate([
            self.authorLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 4.0),
            self.authorLabel.leftAnchor.constraint(equalTo: self.iconImage.rightAnchor, constant: 12.0),
            self.authorLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
            ])
    }
    
    private func addAlbumLabel() {
        self.contentView.addSubview(self.albumLabel)
        NSLayoutConstraint.activate([
            self.albumLabel.topAnchor.constraint(equalTo: self.authorLabel.bottomAnchor, constant: 4.0),
            self.albumLabel.leftAnchor.constraint(equalTo: self.iconImage.rightAnchor, constant: 12.0),
            self.albumLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
            ])
    }
}
