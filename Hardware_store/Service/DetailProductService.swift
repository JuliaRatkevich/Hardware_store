//
//  DetailProductService.swift
//  Hardware_store
//
//  Created by Yuliya Ratkevcih on 23.11.22.
//

import Foundation

protocol DetailProductService {
    func load(id: Int) async throws -> Product
}
