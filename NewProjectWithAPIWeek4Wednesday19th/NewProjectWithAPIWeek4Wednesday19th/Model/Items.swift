//
//  Items.swift
//  NewProjectWithAPIWeek4Wednesday19th
//
//  Created by Payam Karbassi on 19/04/2023.
//

import Foundation

//   let welcome = try? JSONDecoder().decode(Item.self, from: jsonData)

// MARK: - Item
struct Item: Decodable {
    let products: [Product]
    let total, skip, limit: Int
}

// MARK: - Product
struct Product: Decodable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
}
