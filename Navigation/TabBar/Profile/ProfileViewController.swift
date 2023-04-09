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
    
    let headerCell = ProfileHeaderView()
    
    lazy var avatar = headerCell.avatarImageView
    
    lazy var superviewWidth: CGFloat = view.frame.width
    
    let avatarBackgroundView: UIView = {
        let backView = UIView()
        backView.backgroundColor = .white
        backView.alpha = 0
        return backView
    }()
    
    let xButton: UIButton = {
        let button = UIButton()
        button.setTitle("ⓧ", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var isAvatarFullscreen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        setupAnimation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    func setupUI() {
        view.addSubview(tableView)
        setupTableView()
        setupAvatarBackgroundView()
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
    
    func setupAnimation() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(headerCellAvatarTapped))
        avatar.isUserInteractionEnabled = true
        avatar.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func headerCellAvatarTapped() {
#if DEBUG
        print("avatar tapped")
#endif
        guard !isAvatarFullscreen else { return }
        
        isAvatarFullscreen.toggle()
        
        headerCell.avatarImageView.removeFromSuperview()
        view.addSubview(avatar)
        avatar.translatesAutoresizingMaskIntoConstraints = true
        
        UIView.animate(withDuration: 0.5) {
            self.avatar.layer.frame = CGRect(x: self.view.center.x - self.superviewWidth / 2, y: self.view.center.y / 2, width: self.superviewWidth, height: self.superviewWidth)
            self.avatarBackgroundView.alpha = 0.5
        }
    }
    
    func setupAvatarBackgroundView() {
        avatarBackgroundView.frame = self.view.frame
        
        view.insertSubview(avatarBackgroundView, belowSubview: avatar)
        avatarBackgroundView.addSubview(xButton)
        
        xButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        xButton.rightAnchor.constraint(equalTo: avatarBackgroundView.rightAnchor, constant: -20).isActive = true
        
        xButton.addTarget(self, action: #selector(xButtonTapped), for: .touchUpInside)
    }
    
    @objc func xButtonTapped() {
#if DEBUG
        print("xButton tapped")
#endif
        avatar.removeFromSuperview()
        headerCell.insertSubview(headerCell.avatarImageView, aboveSubview: headerCell)
        
        UIView.animate(withDuration: 0.5) {
            self.avatar.layer.frame = CGRect(x: 16, y: 16, width: 120, height: 120)
            self.avatar.layer.cornerRadius = 120 / 2
            self.avatarBackgroundView.alpha = 0
        }

        isAvatarFullscreen.toggle()
    }
}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        postArr.count + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            return headerCell
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
