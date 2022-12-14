//
//  DetailProductViewModel.swift
//  Hardware_store
//
//  Created by Yuliya Ratkevcih on 25.11.22.
//

import Foundation

final class DetailProductViewModel: ObservableObject {
    private let service: DetailProductService
    private let productID: Int
    @Published var state: State
    
    enum State {
        case loading
        case failure
        case loaded(Product)
    }
    
    init(productID: Int, service: DetailProductService) {
        self.service = service
        self.productID = productID
        self.state = State.loading
        load()
    }
    
    func load() {
        Task {
            do {
                let product = try await service.load(id: self.productID)
                DispatchQueue.main.async {
                    self.state = State.loaded(product)
                }

            } catch {
                print(error)
                DispatchQueue.main.async {
                    self.state = State.failure
                }
            }
        }
    }
}
