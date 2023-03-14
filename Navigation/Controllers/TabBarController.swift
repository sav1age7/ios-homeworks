//
//  TabBarController.swift
//  Navigation
//
//  Created by Юзер on 04.02.2023.
//

import UIKit

class TabBarController: UITabBarController {
    var feedTabNaviController: UINavigationController!
    var profileTabNaviController: UINavigationController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
    }
    
    func setup() {
        feedTabNaviController = UINavigationController.init(rootViewController: FeedViewController())
        profileTabNaviController = UINavigationController.init(rootViewController: LogInViewController())

        viewControllers = [feedTabNaviController, profileTabNaviController]
        
        let item1 = UITabBarItem(title: "feed", image: UIImage(systemName: "text.bubble"), tag: 0)
        let item2 = UITabBarItem(title: "profile", image: UIImage(systemName: "person.fill"), tag: 1)

        feedTabNaviController.tabBarItem = item1
        profileTabNaviController.tabBarItem = item2
    }
}
