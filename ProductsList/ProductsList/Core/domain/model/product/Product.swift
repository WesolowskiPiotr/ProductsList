//
//  Product.swift
//  ProductsList
//
//  Created by Piotr Wesołowski on 27/02/2023.
//

import Foundation

struct Product: Codable, Hashable {
    let id: String
    let name: String
    let price: Double
    let description: String
    let imageUrl: String
}

extension Product {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case price = "price"
        case description = "description"
        case imageUrl = "imageUrl"
    }
    
    static let example = Product(
        id: "id",
        name: "Name",
        price: 9.99,
        description: "Description",
        imageUrl: "url"
    )
}
