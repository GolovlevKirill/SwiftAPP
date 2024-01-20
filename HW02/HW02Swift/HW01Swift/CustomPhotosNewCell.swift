
//
//  CustomPhotosNewCell.swift
//  HW01Swift
//
//  Created by Лариса on 20/01/2024.
//  Copyright © 2024 Kirill. All rights reserved.
//

import UIKit

final class CustomPhotosNewCell: UICollectionViewCell {
    
    private var cellImage = UIImageView(image: UIImage(systemName: "person"))
    
    var tap: ((UIImage) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        addConstraints()
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(click))
        addGestureRecognizer(recognizer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(cellImage)
    }
    
    private func addConstraints() {
        cellImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            cellImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellImage.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            cellImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cellImage.leftAnchor.constraint(equalTo: contentView.leftAnchor),
        ])
    }
        @objc func click() {
            tap?(cellImage.image ?? UIImage())
        }
}
