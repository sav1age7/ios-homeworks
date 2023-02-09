//
//  FirstTabBarController.swift
//  Navigation
//
//  Created by Юзер on 04.02.2023.
//

import UIKit

class FeedViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addButton()
    }
    
    func addButton() {
        let button = UIButton.init(frame: CGRect(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY, width: 160, height: 40))
        button.setTitle("Touch!", for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title1)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(tapOnTouchButton), for: .touchUpInside)
        
        view.addSubview(button)
    }
    
    @objc
    func tapOnTouchButton() {
        let exampleController = PostViewController()
        navigationController?.pushViewController(exampleController, animated: true)
    }
}
