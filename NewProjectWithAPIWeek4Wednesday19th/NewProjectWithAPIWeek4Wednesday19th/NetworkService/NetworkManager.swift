//
//  NetworkManager.swift
//  NewProjectWithAPIWeek4Wednesday19th
//
//  Created by Payam Karbassi on 19/04/2023.
//

import Foundation
class NetworkManager :NetworkableProtocol {
    
    func getAllDataFromAPI<T>(withUrl urlString: String, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        
        guard let url = URL(string: urlString) else {print("DEBUG: Could not get URL");return}
        
        let sharedSession = URLSession.shared
        sharedSession.dataTask(with: url) { data , response , error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("DEBUG: Error getting response")
                return
            }
            guard let data = data else {print("DEBUG: Failed to get data!");return}
            
            do{
                let item = try JSONDecoder().decode(Item.self, from: data)
                completion(.success(item as! T))
            }catch {
                print("DEBUG: error : ",error.localizedDescription)
            }
            
        }.resume()
    }
}
