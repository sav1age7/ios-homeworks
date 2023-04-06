//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Юзер on 27.03.2023.
//

import UIKit

class PhotosViewController: UIViewController {
    lazy private(set) var photosCollectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collection.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        viewLayout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupCollectionView()
    }
    
    func addSubviews() {
        view.addSubview(photosCollectionView)
    }
    
    func setupCollectionView() {
        photosCollectionView.frame = view.safeAreaLayoutGuide.layoutFrame
        photosCollectionView.delegate = self
        photosCollectionView.dataSource = self
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

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        8
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        8
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthAndHeight = (view.safeAreaLayoutGuide.layoutFrame.width - 8 * 4 ) / 3
        return CGSize(width: widthAndHeight, height: widthAndHeight)
    }
}
