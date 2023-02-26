//
//  FirstTabBarController.swift
//  Navigation
//
//  Created by Юзер on 04.02.2023.
//

import UIKit

class FeedViewController: UIViewController {
    
    let post = Post(title: "New Title")
    
    let vStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let countOfButtons = 2
    
    private(set) var buttons = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupConstraints()
    }
    
    @objc
    private func tapOnTouchButton() {
        let nextController = PostViewController()
        nextController.title = post.title
        navigationController?.pushViewController(nextController, animated: true)
    }
    
    private func addSubviews() {
        view.addSubview(vStack)
        for number in 1...countOfButtons {
            vStack.addArrangedSubview(addNextButtonToStack(title: "Button \(number)", tag: number))
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            vStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            vStack.widthAnchor.constraint(equalToConstant: 200),
            vStack.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func addNextButtonToStack(title: String, tag: Int) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.tintColor = .white
        button.backgroundColor = .blue
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(tapOnTouchButton), for: .touchUpInside)
        button.tag = tag
        return button
    }
}
