//
//  ViewController.swift
//  PhotoApp
//
//  Created by Admin on 11/27/20.
//

import UIKit

class PhotoViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var images = [ModelImage]()
    let items = ["All photos", "Favourites"]
    var selectedItem = 0
    
    lazy var segmentedController: UISegmentedControl = {
        let control = UISegmentedControl(items: items)
        control.backgroundColor = .red
        control.selectedSegmentIndex = 0
        control.layer.cornerRadius = 25
        control.layer.borderWidth = 1
        control.layer.masksToBounds = true
        
        control.frame = CGRect(x: view.center.x - (view.frame.size.width - 20)/2, y: view.frame.size.height - 100, width: view.frame.size.width - 20, height: 50)
        return control
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.register(LeftMainViewCell.self, forCellWithReuseIdentifier: "cell")
        
        for i in 1...60 {
            images.append(ModelImage(imageName: "\(i)"))
        }
        
        segmentedController.addTarget(self, action: #selector(changeColor(_:)), for: .valueChanged)
        setupSegmentedController()
        processImages()
    }

    private func setupSegmentedController() {
        view.addSubview(segmentedController)
    }
    
    @objc func changeColor(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            selectedItem = 0
            collectionView.reloadData()
        case 1:
            selectedItem = 1
            collectionView.reloadData()
        default:
            selectedItem = 0
        }
    }

    func processImages()
    {
        images = FindingSimilarImages.similarImages(inputImages: images)
    }

    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PhotoCell
        cell.photo.image = UIImage(named: images[indexPath.item].imageName)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size = CGSize(width: (view.frame.width / 3), height: view.frame.width / 3)
        if selectedItem == 1 {
            if images[indexPath.item].main {
                size = CGSize(width: view.frame.width * 2 / 3, height: view.frame.width * 2 / 3)
            }
        }
        return size
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}


