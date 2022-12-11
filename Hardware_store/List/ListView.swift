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
                    viewModel.load()
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
                .padding(.leading)
                .listStyle(.plain)
            }
        }
    }
}
                        
    

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        let view = ListView(viewModel: ListViewModel(service: ListServiceAPI()))
        return view
    }
}
