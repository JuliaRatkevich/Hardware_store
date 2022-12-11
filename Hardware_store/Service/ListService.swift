//
//  Service.swift
//  Hardware_store
//
//  Created by Yuliya Ratkevcih on 19.11.22.
//

import Foundation

protocol ListService {
    func load() async throws -> [Product]
}
