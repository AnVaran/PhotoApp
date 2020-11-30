//
//  ViewCell.swift
//  PhotoApp
//
//  Created by Admin on 11/30/20.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .red
        setupPhotos()
    }
    
    let photo: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .blue
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    func setupPhotos() {
        addSubview(photo)
        contentView.clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        photo.frame = contentView.bounds
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


