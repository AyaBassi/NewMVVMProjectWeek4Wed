//
//  FakeNetworkManager.swift
//  NewProjectWithAPIWeek4Wednesday19thTests
//
//  Created by Payam Karbassi on 20/04/2023.
//

import Foundation

@testable import NewProjectWithAPIWeek4Wednesday19th
class FakeNetworkManager : NetworkableProtocol {
    
    func getAllDataFromAPI<T>(withUrl urlString: String, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
     
        guard let url = URL(string: urlString) else {return}
        
        let bundle = Bundle(for: FakeNetworkManager.self)
        
        // give me this file of type json from this bundle
        guard let path = bundle.url(forResource: url.absoluteString, withExtension: "json") else {return}
        
        do {
            
            // read the data from that json file and get me data in terms of bytes
            let data = try Data(contentsOf: path)
            // convert those bytes into a json model of type FruitStats struct to get list of fruits
            let dataObject = try JSONDecoder().decode(T.self, from: data)
            
            print(dataObject)
            
            completion(.success(dataObject))
        } catch{
            completion(.failure(error))
            print(error.localizedDescription)
        }
    }
}


//import Foundation
//@testable import MVVM_Fruits
//
///**
// https://medium.com/@danmarcenco/mockable-networking-layer-in-ios-4b2361339630
// Mockable Networking layer in iOS
// */
//
//// MARK: - Faking
//// subclassing FakeNetworkManager to NetworkManager will create more problems
//class FakeNetworkManager : Networkable_Protocol{
//
//
//    func getDataFromAPIUsingClosure<T:Decodable>(urlString: String, type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
//        print("Before API")
//
//        // Faking
//        guard let url = URL(string: urlString) else {return}
//        // take a bundle where FakeNetworkManager file is present i.e the folder its in i.e MVVM_FruitsTests Bundle
//        let bundle = Bundle(for: FakeNetworkManager.self)
//
//        // give me this file of type json from this bundle
//        guard let path = bundle.url(forResource: url.absoluteString, withExtension: "json") else {return}
//
//        do {
//
//            // read the data from that json file and get me data in terms of bytes
//            let data = try Data(contentsOf: path)
//            // convert those bytes into a json model of type FruitStats struct to get list of fruits
//            let fruitsList = try JSONDecoder().decode(type, from: data)
//            print(fruitsList)
//
//            completion(.success(fruitsList))
//        } catch{
//            completion(.failure(error))
//            print(error.localizedDescription)
//        }
//
//        print("End of function API")
//    }
//
//}
