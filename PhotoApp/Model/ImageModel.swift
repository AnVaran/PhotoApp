//
//  ImageModel.swift
//  PhotoApp
//
//  Created by Admin on 11/30/20.
//

import UIKit

struct ModelImage: Identifiable {
    public var id: Int = 0
    public var main: Bool = false
    public var imageName: String
    public var distance : Float = 0
}
