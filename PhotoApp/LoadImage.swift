//
//  CustomImageView.swift
//  Pixel
//
//  Created by Admin on 04.11.2020.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

class LoadImage: UIImageView {
    
    var task: URLSessionDataTask!
    
    func loadImage(from string: String) {
        image = nil
        DispatchQueue.main.async {
            self.image = UIImage(named: string)
        }
    }
        
}
    

