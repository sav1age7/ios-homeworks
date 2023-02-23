//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Юзер on 18.02.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    var photoView: UIImageView = {
        let photoView = UIImageView(image: UIImage(named: "photo"))
        photoView.layer.borderWidth = 3
        photoView.layer.borderColor = CGColor(gray: 1, alpha: 1)
        photoView.translatesAutoresizingMaskIntoConstraints = false
        return photoView
    }()
    
    var nameLabelView: UILabel = {
        let label = UILabel()
        label.text = "Hipster Cat"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var statusLabelView: UILabel = {
        let label = UILabel()
        label.text = "Waiting for something..."
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var showStatusButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show status", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .blue
        button.layer.cornerRadius = 4

        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.masksToBounds = false

        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(photoView)
        addSubview(nameLabelView)
        addSubview(statusLabelView)
        addSubview(showStatusButton)
        setupConstraints()
    }
  
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    func setupConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            photoView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            photoView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16),
            photoView.widthAnchor.constraint(equalToConstant: 100),
            photoView.heightAnchor.constraint(equalTo: photoView.widthAnchor, multiplier: 1),
            
            nameLabelView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
            nameLabelView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 27),
            nameLabelView.heightAnchor.constraint(equalToConstant: 30),
            
            showStatusButton.topAnchor.constraint(equalTo: photoView.bottomAnchor, constant: 16),
            showStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            showStatusButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            showStatusButton.heightAnchor.constraint(equalToConstant: 50),
            
            statusLabelView.leadingAnchor.constraint(equalTo: nameLabelView.leadingAnchor),
            statusLabelView.bottomAnchor.constraint(equalTo: showStatusButton.topAnchor, constant: -34),
            
        ])
    }
    

    
    func setupUI() {
        photoView.layer.masksToBounds = true
        photoView.layer.cornerRadius = photoView.frame.width / 2
    }
}
