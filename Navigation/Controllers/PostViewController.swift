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
        
        let post = UITextView(frame: CGRect(x: 30, y: 30, width: 100, height: 100))
        post.text = "test"
        post.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        post.backgroundColor = .black
        post.textColor = .white
        view.addSubview(post)
        view.backgroundColor = .gray
    }
}
