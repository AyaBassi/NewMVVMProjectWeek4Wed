//
//  NetworkableProtocol.swift
//  NewProjectWithAPIWeek4Wednesday19th
//
//  Created by Payam Karbassi on 19/04/2023.
//

import UIKit

protocol NetworkableProtocol {
    func getAllDataFromAPI<T:Decodable>(withUrl urlString:String,completion: @escaping (Result<T,Error>)->Void)
}

protocol ImageGetableProtocol {
    func getImage(urlString:String?,completion:@escaping(UIImage?)->Void)
}
