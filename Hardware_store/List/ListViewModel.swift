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
    private let service: ListService
    @Published var state: State
    
    enum State {
        case loading
        case failure
        case loaded([ListProduct])
    }
    
    init(service: ListService) {
        self.service = service
        self.state = State.loading
        load()
    }
    
    
    func load() {
        Task {
            do {
                let products = try await service.load()
                let listProducts = products.map { product in
                    ListProduct(id: product.id,
                                title: product.title,
                                description: product.description,
                                price: product.price,
                                rating: String(format: "%.1f\\%.0f", product.rating, product.totalRating),
                                thumbnail: product.thumbnail)
                }
                DispatchQueue.main.async {
                    self.state = State.loaded(listProducts)
                }
            
            } catch {
                print(error)
                DispatchQueue.main.async {
                    self.state = State.failure
                }
            }
        }
    }
    
    
//    func schortRating(rating:Double) -> Double {
//        let shorTating =
//    }
}

