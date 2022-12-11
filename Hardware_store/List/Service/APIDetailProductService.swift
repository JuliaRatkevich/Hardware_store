//
//  APIDetailProduct.swift
//  Hardware_store
//
//  Created by Yuliya Ratkevcih on 23.11.22.
//

import Foundation

final class APIDetailProductService: DetailProductService {
    enum APIError: Error {
        case invalidURL
        case invalidRespoce
    }
    
    func load(id: Int) async throws -> Product {
        guard let url = URL(string: "https://dummyjson.com/products/\(id)") else {
            throw APIError.invalidURL
            
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invalidRespoce
        }
        let decoder = JSONDecoder()
        let model = try decoder.decode(Product.self, from: data)
        return model
        
    }
    
}
    
    

