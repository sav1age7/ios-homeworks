//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Юзер on 27.03.2023.
//

import UIKit

class PhotosViewController: UIViewController {
    
    let photosCollectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
    }
    
    func addSubviews() {
        view.addSubview(photosCollectionView)
        setupPhotosCollectionView()
    }
    
    func setupPhotosCollectionView() {
        photosCollectionView.frame = view.safeAreaLayoutGuide.layoutFrame
        photosCollectionView.delegate = self
        photosCollectionView.dataSource = self
        photosCollectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            photosCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            photosCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            photosCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            photosCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        21
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = photosCollectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as? PhotoCollectionViewCell else {
            fatalError("could not dequeueReusableCell PhotoCollectionViewCell")
        }
        cell.configure(imageNumber: indexPath.row + 1)
        return cell

    }
    
    
}
extension PhotosViewController: UICollectionViewDelegate {}
