//
//
// ExtensionImageView.swift
// MarvelApp
//
// Using Swift 5.0
//
// Created by Ing. Miguel de Jesús Robledo Vera on 06/10/21.
// Copyright (c) 2021 and Confidential to ROBLEDO All rights reserved.
//


import UIKit


public enum ImageSizes: String {
    case square_small = "standard_small"            //65x45px
    case square_medium = "standard_medium"          //100x100px
}


public extension UIImageView {
    
    /// This function takes care of the downloading of images and checks if the images are cached.
    /// - Parameters:
    ///   - url: url of the image to display
    ///   - placeholder: temporary image, it will be displayed in what finishes loading the image from the url
    ///   - size: Image size required, in case resizing is needed
    ///   - mime: image extension
    ///   - completion: Bool: Returns true if the image was downloaded, false if not
    func load(url: String?, placeholder: UIImage? = nil, size: ImageSizes, mime: String, completion: ((Bool)->(Void))?) {
        image = placeholder
        guard let resource = url else { return }
        guard let url = URL(string: "\(resource)/\(size.rawValue).\(mime)") else { return }
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 20)
        
        // Check if cached image exists
        if let data = URLCache.shared.cachedResponse(for: request)?.data, let image = UIImage(data: data) {
            self.image = image
        }
        URLSession
            .shared
            .dataTask(with: request) { (data, response, _) in
                
                if let data = data, let response = response {
                    // Cache image data
                    let cachedData = CachedURLResponse(response: response, data: data)
                    URLCache.shared.storeCachedResponse(cachedData, for: request)
                    
                    DispatchQueue.main.async {
                        if let image = UIImage(data: data) {
                            self.image = image
                            if let completion = completion { completion(true) }
                        } else {
                            if let completion = completion { completion(false) }
                        }
                    }
                }
            }
            .resume()
    }    
}
