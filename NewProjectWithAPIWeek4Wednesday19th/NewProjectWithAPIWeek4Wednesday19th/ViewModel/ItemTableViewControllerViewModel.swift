//
//  ItemTableViewControllerViewModel.swift
//  NewProjectWithAPIWeek4Wednesday19th
//
//  Created by Payam Karbassi on 19/04/2023.
//

import UIKit
class ItemTableViewControllerViewModel {
    var anyManager:NetworkableProtocol?
    var anyImageManager:ImageGetableProtocol?
    var item : Item?
    //var image : UIImage?
    
    init(anyManager : NetworkableProtocol,anyImageManager:ImageGetableProtocol = ImageNetworkManger()){
        self.anyManager = anyManager
        self.anyImageManager = anyImageManager
    }
    
//    init(anyImageManager:ImageGetableProtocol){
//
//    }
    
    func getAllDetailsWithClosure(withUrl url : String,completion: @escaping()->Void){
        anyManager?.getAllDataFromAPI(withUrl: url) { (result:Result<Item,Error> )in
            switch result {
            case .success(let item):
                self.item = item
                completion()
            case .failure(let error):
                print("Error \(error.localizedDescription)")
            }
        }
    }
}
