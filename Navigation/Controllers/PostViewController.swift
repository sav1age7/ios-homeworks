//
//  PostViewController.swift
//  Navigation
//
//  Created by Юзер on 04.02.2023.
//

import UIKit

class PostViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        setupBarButton()
    }
    
    func setupBarButton() {
        let baritem = UIBarButtonItem(image: UIImage(systemName: "window.casement.closed"), style: .plain, target: self, action: #selector(showModal))
        self.navigationItem.rightBarButtonItems = [baritem]
    }
    @objc
    func showModal() {
        let modalVC = InfoViewController()
        navigationController?.present(modalVC, animated: true)
    }
}

