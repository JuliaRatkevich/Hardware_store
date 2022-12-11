//
//  APIServiceList.swift
//  Hardware_store
//
//  Created by Yuliya Ratkevcih on 19.11.22.
//

import Foundation

final class APIServiceList: ListService {
    enum APIError: Error {
        case invalidURL
        case invalidRespoce
    }
    
    
    func load() async throws -> [Product] {
        guard let url = URL(string: "https://dummyjson.com/products") else {
            throw APIError.invalidURL
        }
        let result = try await URLSession.shared.data(from: url)
        
        guard let response = result.1 as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invalidRespoce
        }
        let decoder = JSONDecoder()
        let model = try decoder.decode(ListItem.self, from: result.0)
        return model.products
        
    }
    
    
}
