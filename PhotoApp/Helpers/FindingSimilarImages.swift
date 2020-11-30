//
//  FindingSimilarImages.swift
//  PhotoApp
//
//  Created by Admin on 11/30/20.
//

import UIKit
import Vision

class FindingSimilarImages {
    static func similarImages(inputImages: [ModelImage]) -> [ModelImage] {
        var images = inputImages
        
        var observation : VNFeaturePrintObservation?
        var sourceObservation : VNFeaturePrintObservation?
        var tempData = images
        images.removeAll()
        var sortedImages = [ModelImage]()
        
        
        while(tempData.count != 0) {
            sourceObservation = featureprintObservationForImage(image: UIImage(named: tempData[tempData.count-1].imageName)!)
            tempData[tempData.count-1].id = 1
            tempData = tempData.enumerated().map { (i,m) in
                var model = m
                if let uiimage = UIImage(named: model.imageName){
                    observation = featureprintObservationForImage(image: uiimage)
                    do{
                        var distance = Float(0)
                        if let sourceObservation = sourceObservation{
                            try observation?.computeDistance(&distance, to: sourceObservation)
                            model.distance = distance
                        }
                    }catch{
                        print("errror occurred..")
                    }
                }
                return model
            }
            var index = tempData.count-1
            while(index != -1) {
                if tempData[index].distance < 15 {
                    sortedImages.append(tempData[index])
                    tempData.remove(at: index)
                }
                index -= 1
            }
            if(sortedImages.count > 1) {
                sortedImages[0].main = true
            }
            images += sortedImages
            sortedImages.removeAll()
        }
        for (index1, _) in images.enumerated() {
            images[index1].id = index1
        }
        
        return images
    }
    
    static func featureprintObservationForImage(image: UIImage) -> VNFeaturePrintObservation? {
        let requestHandler = VNImageRequestHandler(cgImage: image.cgImage!, options: [:])
        let request = VNGenerateImageFeaturePrintRequest()
        do {
            try requestHandler.perform([request])
            return request.results?.first as? VNFeaturePrintObservation
        } catch {
            print("Vision error: \(error)")
            return nil
        }
    }
}
