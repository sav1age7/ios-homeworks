//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Юзер on 23.03.2023.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    let photosLabel: UILabel = {
        let photos = UILabel()
        photos.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        photos.textColor = .black
        photos.text = "Photos"
        photos.translatesAutoresizingMaskIntoConstraints = false
        return photos
    }()
    
    let arrowImageView: UIImageView = {
        let arrowImageView = UIImageView()
        arrowImageView.image = UIImage(systemName: "arrow.right")
        arrowImageView.tintColor = .black
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        return arrowImageView
    }()
    
    let photosStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let screenWidth = UIScreen.main.bounds.width
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        contentView.addSubview(photosLabel)
        contentView.addSubview(arrowImageView)
        contentView.addSubview(photosStackView)
        addImagesToStackView(count: 4)
    }
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            photosLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            photosLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12),
            
            arrowImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -12),
            arrowImageView.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
            arrowImageView.widthAnchor.constraint(equalTo: arrowImageView.heightAnchor),
            arrowImageView.heightAnchor.constraint(equalTo: photosLabel.heightAnchor),
            
            photosStackView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 12),
            photosStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12),
            photosStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -12),
            photosStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
        
    }
    
    func addImagesToStackView(count: Int) {
        guard count > 0 else { return }
        let countOfSpaces = count == 1 ? 1 : count - 1
        
        let imageWidth = CGFloat(Int(screenWidth) - 8 * (countOfSpaces)) / CGFloat(count)
        
        photosStackView.heightAnchor.constraint(equalToConstant: imageWidth).isActive = true
        for imageIndex in 1...count {
            let nextImage = getImageView(imageNumber: imageIndex, width: imageWidth)
            photosStackView.addArrangedSubview(nextImage)
        }
    }
    
    func getImageView(imageNumber: Int, width: CGFloat) -> UIImageView {
        guard let image = UIImage(named: "\(imageNumber)") else { return UIImageView() }
        
        let imageView = UIImageView()
        imageView.image = image
        imageView.frame = CGRect(x: 0, y: 0, width: width, height: width)
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = UIColor(white: 0.7, alpha: 0.1)
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        
        return imageView
    }
}
