//
//  DetailProductView.swift
//  Hardware_store
//
//  Created by Yuliya Ratkevcih on 25.11.22.
//

import SwiftUI

struct DetailProductView: View {
    @ObservedObject private var viewModel: DetailProductViewModel
    
    private let currency = "$"
    
    init(viewModel: DetailProductViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        switch viewModel.state {
        case .loading:
            LoadingView()
        case .failure:
            FailureView()
        case .loaded(let product):
        HStack {
        VStack {
            Text("\(product.title)")
                .font(.largeTitle)
            Text("\(product.price)")
            Text("\(product.discountPercentage)")
            Text("\(product.rating)")
            Text("\(product.stock)")
            Text("\(product.brand)")
            Text("\(product.category)")
            
            AsyncImage(url: URL(string: product.thumbnail))
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(Rectangle())
                .shadow(radius: 10)
            
            Text("\(product.description)")
                .font(.subheadline)
            
            
        }
            Spacer()
            VStack {
                Text("\(product.price)" + currency)
                Text("\(product.rating)")
                
            }
            
            Divider()
        }
        }
    }
}

//struct DetailProductView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailProductView(product: Product(id: 1, title: "Tittle", description: "llll", price: 90, discountPercentage: 10, rating: 3.6, stock: 2, brand: "samsung", category: "phone", thumbnail: "ll", images: ["ll","kk"]))
//    }
//}
