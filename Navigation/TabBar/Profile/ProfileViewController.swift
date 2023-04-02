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
        case headerCell = "ProfileHeaderView_ReuseID"
        case postCell = "PostTabelViewCell_ReuseID"
        case photosCell = "PhotosTableViewCell_ReuseID"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    func setupUI() {
        view.addSubview(tableView)
        setupTableView()
    }
    
    func setupConstraints() {
        let safeArea = self.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
        ])
    }
    
    func setupTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 500
        
        tableView.register(ProfileHeaderView.self, forCellReuseIdentifier: CellReuseID.headerCell.rawValue)
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: CellReuseID.postCell.rawValue)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: CellReuseID.photosCell.rawValue)
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        postArr.count + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellReuseID.headerCell.rawValue, for: indexPath) as? ProfileHeaderView else {
                fatalError("could not dequeueReusableCell \(CellReuseID.headerCell.rawValue)")
            }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellReuseID.photosCell.rawValue, for: indexPath) as? PhotosTableViewCell else {
                fatalError("could not dequeueReusableCell \(CellReuseID.photosCell.rawValue)")
            }
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellReuseID.postCell.rawValue, for: indexPath) as? PostTableViewCell else {
                fatalError("could not dequeueReusableCell \(CellReuseID.postCell.rawValue)")
            }
            cell.configure(with: postArr[indexPath.row - 2])
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            let nextController = PhotosViewController()
            nextController.title = "Photo Gallery"
            navigationController?.navigationBar.isHidden = false
            navigationController?.pushViewController(nextController, animated: true
            )
        }
    }
}

extension ProfileViewController: UITableViewDelegate {}
