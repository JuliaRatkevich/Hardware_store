//
//  ListViewModel.swift
//  Hardware_store
//
//  Created by Yuliya Ratkevcih on 19.11.22.
//

import Foundation

final class ListViewModel: ObservableObject {
    struct ListProduct: Identifiable {
        let id: Int
        let title: String
        let description: String
        let price: Int
        let rating: String
        let thumbnail: String
    }
    enum State {
        case initial
        case loading
        case failure
        case loaded([ListProduct])
    }
    
    private let service: ListService
    @Published private(set) var state: State
    
    init(service: ListService) {
        self.service = service
        self.state = .initial
    }
    
    func onAppear() {
        if case .loading = state {
            return
        }
        
        load()
    }
    
    private func load() {
        state = .loading
        
        Task {
            do {
                let products = try await service.load()
                let listProducts = products.map { product in
                    ListProduct(id: product.id,
                                title: product.title,
                                description: product.description,
                                price: product.price,
                                rating: String(format: "%.1f", product.rating),
                                thumbnail: product.thumbnail)
                }
                DispatchQueue.main.async {
                    self.state = State.loaded(listProducts)
                }
            } catch {
                DispatchQueue.main.async {
                    self.state = State.failure
                }
            }
        }
    }
}
