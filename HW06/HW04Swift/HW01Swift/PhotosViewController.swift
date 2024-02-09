//
//  PhotosViewController.swift
//  HW01Swift
//
//  Created by Kirill on 20/01/2024.
//  Copyright © 2024 Kirill. All rights reserved.
//

import UIKit

final class PhotosViewController: UICollectionViewController {
    
    
    private let networkService = NetworkService()
    
    private var model: [Photo] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = Theme.currentTheme.backgroundColor
        collectionView.backgroundColor = Theme.currentTheme.backgroundColor
        
        title = "Photos"
        
        
        collectionView.register(CustomPhotosNewCell.self, forCellWithReuseIdentifier: "cell") // Вместо "cell" можно любой набор символов
        
        
        
        
        
        networkService.getPhotos { [weak self] photos in
            
            self?.model = photos
            
            
            DispatchQueue.main.async {
                
                
                self?.collectionView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = Theme.currentTheme.backgroundColor
        collectionView.backgroundColor = Theme.currentTheme.backgroundColor
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        model.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CustomPhotosNewCell else {
            return UICollectionViewCell()
        }
        
        cell.updateCell(photo: model[indexPath.row])
        
        return cell
    }
}




extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = UIScreen.main.bounds.width
        let cellSize = width / 2 - 20
        return CGSize(width: cellSize, height: cellSize)
    }
}
