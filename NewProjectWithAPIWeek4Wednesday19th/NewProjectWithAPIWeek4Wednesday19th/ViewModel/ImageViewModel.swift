//
//  ImageViewModel.swift
//  NewProjectWithAPIWeek4Wednesday19th
//
//  Created by Payam Karbassi on 20/04/2023.
//

import UIKit

class ImageViewModel{
    
    var anyImageManager:ImageGetableProtocol
    
    init(anyImageManager:ImageGetableProtocol = ImageNetworkManger()){
        self.anyImageManager = anyImageManager
    }
    
    func getImage(withUrl url:String,completion: @escaping(UIImage?)->Void){
        anyImageManager.getImage(urlString: url , completion: { image in
            completion(image)
        })
    }
    
}
