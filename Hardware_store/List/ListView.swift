//
//  ListView.swift
//  Hardware_store
//
//  Created by Yuliya Ratkevcih on 19.11.22.
//

import SwiftUI

struct ListView: View {
    @ObservedObject private var viewModel: ListViewModel
    
    init(viewModel: ListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        switch viewModel.state {
        case .initial:
            Text("")
                .onAppear {
                    viewModel.onAppear()
                }
        case .loading:
            LoadingView()
        case .failure:
            FailureView()
        case .loaded(let products):
            NavigationView {
                List(products) { product in
                    NavigationLink {
                        let viewModel = DetailProductViewModel(productID: product.id, service: DetailProductServiceAPI())
                        DetailProductView(viewModel: viewModel)
                    } label: {
                        ProductListRowView(product: product)
                    }
                }
                .navigationTitle("Items")
                .listStyle(.plain)
            }
        }
    }
}
                        
    

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        let view = ListView(viewModel: ListViewModel(service: FakeService()))
        return view
    }
    
    class FakeService: ListService {
        func load() async throws -> [Product] {
            [
                Product(id: 1, title: "Product#1", description: "Good item", price: 12, discountPercentage: 3.3, rating: 2.4, stock: 1, brand: "Brand", category: "Cat", thumbnail: "thumb", images: []),
                Product(id: 2, title: "Product#2", description: "Bad product", price: 123456, discountPercentage: 3.3, rating: 0.4, stock: 1, brand: "Brand", category: "Cat", thumbnail: "thumb", images: [])
            ]
        }
    }
}
