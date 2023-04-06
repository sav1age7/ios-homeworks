//
//  InfoViewController.swift
//  Navigation
//
//  Created by Юзер on 09.02.2023.
//

import UIKit

class InfoViewController: UIViewController {
    let alertController = UIAlertController(title: "Alert", message: "Что-то пошло не по плану", preferredStyle: .alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        addButton()
        addAlert()
    }
    
    func addButton() {
        let button = UIButton.init(frame: CGRect(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY, width: 160, height: 40))
        button.setTitle("Alert", for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title1)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(addTarget), for: .touchUpInside)
        
        view.addSubview(button)
    }
    
    func addAlert() {
       
        var actions: [UIAlertAction] = []
        actions.append(UIAlertAction(title: "OK", style: .default) {_ in
            print("OK")
        })
        actions.append(UIAlertAction(title: "Ignore", style: .default) {_ in
            print("Ignore")
        })
        
        for action in actions {
            alertController.addAction(action)
        }
    }
    
    @objc func addTarget() {
        self.present(alertController, animated: true, completion: nil)
    }
}
