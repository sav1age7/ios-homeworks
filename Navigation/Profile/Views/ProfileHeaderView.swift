//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Юзер on 18.02.2023.
//

import UIKit

class ProfileHeaderView: UITableViewCell {
    var avatarImageView: UIImageView = {
        let photoView = UIImageView(image: UIImage(named: "photo"))
        photoView.layer.borderWidth = 3
        photoView.layer.borderColor = CGColor(gray: 1, alpha: 1)
        photoView.translatesAutoresizingMaskIntoConstraints = false
        return photoView
    }()
    
    var fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Hipster Cat"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Waiting for something..."
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var setStatusButton: UIButton = {
        let button = UIButton()
        button.setTitle("Set status", for: .normal)
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
    
    var statusTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Listening to music"
        textfield.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textfield.textColor = .black
        textfield.backgroundColor = .white
        textfield.layer.cornerRadius = 12
        textfield.layer.borderWidth = 1
        textfield.layer.borderColor = UIColor.black.cgColor
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.borderStyle = .roundedRect
        return textfield
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
        addStatusButtonAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        contentView.addSubview(avatarImageView)
        contentView.addSubview(fullNameLabel)
        contentView.addSubview(statusLabel)
        contentView.addSubview(setStatusButton)
        contentView.addSubview(statusTextField)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    func setupConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 120),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor, multiplier: 1),
            
            fullNameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0),
            fullNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 27),
            fullNameLabel.heightAnchor.constraint(equalToConstant: 30),
            
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            setStatusButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            
            statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -54),
            
            statusTextField.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor) ,
            statusTextField.trailingAnchor.constraint(equalTo: setStatusButton.trailingAnchor) ,
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 6) ,
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            
            setStatusButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
        ])
    }
    
    func setupUI() {
        avatarImageView.layer.masksToBounds = true
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
        self.backgroundColor = .lightGray
    }
    
    func addStatusButtonAction() {
        setStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    @objc func buttonPressed() {
        statusLabel.text = statusTextField.text?.trimmingCharacters(in: [" "])
    }
}
