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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile"
        view.addSubview(headerView)
        setupConstraints()
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
        ])
    }
}


