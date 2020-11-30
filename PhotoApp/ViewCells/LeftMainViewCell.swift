//
//  LeftMainViewCell.swift
//  PhotoApp
//
//  Created by Admin on 11/30/20.
//

import UIKit

class LeftMainViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .red
        setupPhotos()
    }
    
    let mainPhoto: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .blue
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let topPhoto: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .blue
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let bottomPhoto: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .blue
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    func setupPhotos() {
        addSubview(mainPhoto)
        addSubview(topPhoto)
        addSubview(bottomPhoto)
        
        addConstraint(NSLayoutConstraint(item: mainPhoto, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: mainPhoto, attribute: .left, relatedBy: .equal, toItem: contentView, attribute: .left, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: mainPhoto, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: contentView.frame.width*2/3))
        addConstraint(NSLayoutConstraint(item: mainPhoto, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0, constant: contentView.frame.width * 2/3))
        
        addConstraint(NSLayoutConstraint(item: topPhoto, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: topPhoto, attribute: .left, relatedBy: .equal, toItem: mainPhoto, attribute: .right, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: topPhoto, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: contentView.frame.width/3))
        addConstraint(NSLayoutConstraint(item: topPhoto, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0, constant: contentView.frame.width/3))
        
        addConstraint(NSLayoutConstraint(item: bottomPhoto, attribute: .top, relatedBy: .equal, toItem: topPhoto, attribute: .bottom, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: bottomPhoto, attribute: .left, relatedBy: .equal, toItem: mainPhoto, attribute: .right, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: bottomPhoto, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: contentView.frame.width/3))
        addConstraint(NSLayoutConstraint(item: bottomPhoto, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0, constant: contentView.frame.width/3))
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
