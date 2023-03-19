//
//  SecondTabNavigationController.swift
//  Navigation
//
//  Created by Юзер on 04.02.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    private var postArr: [Post] = Post.make()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private enum CellReuseID: String {
        case postCell = "PostTabelViewCell_ReuseID"
    }
    
    let headerView: ProfileHeaderView = {
        let header = ProfileHeaderView()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.backgroundColor = .lightGray
        return header
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }
    
    func setupUI() {
        self.title = "Profile"
        view.backgroundColor = .white
        view.addSubview(headerView)
        view.addSubview(tableView)
        setupTableView()
    }
      
    func setupConstraints() {
        let safeArea = self.view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0),
            headerView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 0),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0) ,
            headerView.heightAnchor.constraint(equalToConstant: 220),
            
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
        ])
    }
    
    func setupTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 500

        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: CellReuseID.postCell.rawValue)

        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        postArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellReuseID.postCell.rawValue, for: indexPath) as? PostTableViewCell else {
            fatalError("could not dequeueReusableCell")
        }
        
        cell.configure(with: postArr[indexPath.row])
        return cell
    }
}

extension ProfileViewController: UITableViewDelegate {}
