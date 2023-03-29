//
//  PhotoCollectionViewCell.swift
//  Navigation
//
//  Created by Юзер on 27.03.2023.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    static let identifier = "PhotoCollectionViewCell"
    
    let photoImageView: UIImageView = {
        let photoImageView = UIImageView()
        photoImageView.contentMode = .scaleAspectFit
        return photoImageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        contentView.addSubview(photoImageView)
        photoImageView.frame = contentView.bounds
    }
    
    func configure(imageNumber: Int) {
        guard let image = UIImage(named: "\(imageNumber)") else {
            photoImageView.image = UIImage(systemName: "questionmark.circle")
            return
        }

        backgroundColor = UIColor(white: 0.7, alpha: 0.1)
        photoImageView.image = image
    }
}
