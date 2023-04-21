//
//  ImageNetworkManger.swift
//  NewProjectWithAPIWeek4Wednesday19th
//
//  Created by Payam Karbassi on 20/04/2023.
//

import UIKit
class ImageNetworkManger: ImageGetableProtocol {
    
    let imageCache = NSCache<NSString, UIImage>()

    func getImage(urlString: String?, completion: @escaping (UIImage?) -> Void) {
        guard let urlString = urlString,
                let url = URL(string: urlString) else {
            print("DEBUG: Failed to get url")
            completion(nil)
            return
        }
        
        //check cached image
        if let cachedImage = imageCache.object(forKey: urlString as NSString)  {
            print("Already cached")
            completion(cachedImage)
            return
        }
    
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                guard let image = UIImage(data: data) else {return}
                self.imageCache.setObject(image, forKey: urlString as NSString)
                print("Caching")
                completion(image)
            }catch {
                print(error)
                completion(nil)
            }
        }
    }
    
}
