//
//  FindingSimilarImages.swift
//  PhotoApp
//
//  Created by Admin on 11/30/20.
//

import UIKit
import Vision

class FindingSimilarImages {
    
    private var completionHandler: (([ModelImage]) -> Void)?
    
    func similarImages(inputImages: [ModelImage], comletionHandler: (([ModelImage]) -> Void)?) {
        
        self.completionHandler = comletionHandler
        var images = [ModelImage]()
        var observation : VNFeaturePrintObservation?
        var sourceObservation : VNFeaturePrintObservation?
        var tempData = inputImages
        //images.removeAll()
        var sortedImages = [ModelImage]()
        
        
        DispatchQueue.global().async {
            while(tempData.count != 0) {
                sourceObservation = self.featureprintObservationForImage(image: UIImage(named: tempData[tempData.count-1].imageName)!)
                tempData[tempData.count-1].id = 1
                tempData = tempData.enumerated().map { (i,m) in
                    var model = m
                    if let uiimage = UIImage(named: model.imageName){
                        observation = self.featureprintObservationForImage(image: uiimage)
                        
                        do{
                            var distance = Float(0)
                            if let sourceObservation = sourceObservation {
                                try observation?.computeDistance(&distance, to: sourceObservation)
                                model.distance = distance
                                print("ModelDistance \(model.distance)")
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
                self.completionHandler?(images)
            }
        }
    }
    
    private func featureprintObservationForImage(image: UIImage) -> VNFeaturePrintObservation? {
        let requestHandler = VNImageRequestHandler(cgImage: image.cgImage!, options: [:])
        let request = VNGenerateImageFeaturePrintRequest()
        request.preferBackgroundProcessing = true
        do {
            try requestHandler.perform([request])
            return request.results?.first as? VNFeaturePrintObservation
        } catch {
            print("Vision error: \(error)")
            return nil
        }
    }
}
