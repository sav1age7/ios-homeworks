//
//  SecondTabNavigationController.swift
//  Navigation
//
//  Created by Юзер on 04.02.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    let headerView: ProfileHeaderView = {
        let header = ProfileHeaderView()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.backgroundColor = .lightGray
        return header
    }()
    
    let someButton: UIButton = {
        let button = UIButton()
        button.setTitle("Some button", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .blue
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile"
        addSubviews()
        setupConstraints()
    }
    
    func addSubviews() {
        view.addSubview(headerView)
        view.addSubview(someButton)
    }
      
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    func setupConstraints() {
        let safeArea = self.view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0),
            headerView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 0),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0) ,
            headerView.heightAnchor.constraint(equalToConstant: 220),
            
            someButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            someButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            someButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: 0),
            someButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}


