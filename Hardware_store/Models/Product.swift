//
//  ListItems.swift
//  Hardware_store
//
//  Created by Yuliya Ratkevcih on 19.11.22.


//

import Foundation

struct ListItem: Decodable {
    let products: [Product]
    let total: Int
    let skip: Int
    let limit: Int
}

struct Product: Decodable {
    let id: Int
    let title: String
    let description: String
    let price: Int
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let brand: String
    let category: String
    let thumbnail: String
    let images: [String]
}
