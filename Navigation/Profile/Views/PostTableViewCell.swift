//
//  CustomTableViewCell.swift
//  Navigation
//
//  Created by Юзер on 17.03.2023.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    private var authorLabel: UILabel = {
        let authorLabel = UILabel()
        authorLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        authorLabel.numberOfLines = 2
        authorLabel.textColor = .black
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        return authorLabel
    }()
    
    private lazy var coverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        descriptionLabel.textColor = .systemGray
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        return descriptionLabel
    }()
    
    private lazy var likesLabel: UILabel = {
        let likesLabel = UILabel()
        likesLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        likesLabel.textColor = .black
        likesLabel.translatesAutoresizingMaskIntoConstraints = false
        return likesLabel
    }()
    
    private lazy var viewsLabel: UILabel = {
        let viewsLabel = UILabel()
        viewsLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        viewsLabel.textColor = .black
        viewsLabel.translatesAutoresizingMaskIntoConstraints = false
        return viewsLabel
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        contentView.addSubview(authorLabel)
        contentView.addSubview(coverImageView)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(likesLabel)
        contentView.addSubview(viewsLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            authorLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            authorLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),

            coverImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 12),
            coverImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            coverImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor),
            coverImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            coverImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: coverImageView.bottomAnchor, constant: 16),
            descriptionLabel.leftAnchor.constraint(equalTo: authorLabel.leftAnchor),
            descriptionLabel.rightAnchor.constraint(equalTo: authorLabel.rightAnchor),
            
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            likesLabel.leftAnchor.constraint(equalTo: descriptionLabel.leftAnchor),
            likesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            viewsLabel.topAnchor.constraint(equalTo: likesLabel.topAnchor),
            viewsLabel.rightAnchor.constraint(equalTo: descriptionLabel.rightAnchor),
            
        ])
    }
    
    func configure(with model: Post) {
        authorLabel.text = model.author
        coverImageView.image = UIImage(named: model.image)
        descriptionLabel.text = model.description
        likesLabel.text = "Likes: \(model.likes)"
        viewsLabel.text = "Views: \(model.views)"
    }
}
