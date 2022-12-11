//
//  ProductListRow.swift
//  Hardware_store
//
//  Created by Yuliya Ratkevcih on 23.11.22.
//

import SwiftUI


struct ProductListRowView: View {
    private enum Constants {
        static let currency = "$"
    }
    private let product: ListViewModel.ListProduct
    
    init(product: ListViewModel.ListProduct) {
        self.product = product
    }
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: product.thumbnail), content: { image in
                image
                    .resizable()
                    .scaledToFit()
            }, placeholder: {
                ProgressView()
            })
            .frame(width:64, height: 64)
            
            VStack(alignment: .leading) {
                Text("\(product.title)")
                    .lineLimit(1)
                    .font(.title3)
                Text("\(product.description)")
                    .lineLimit(2)
                    .font(.subheadline)
            }
            Spacer()
            VStack {
                Text("\(product.price)" + Constants.currency)
                Text("\(product.rating)")
            }
        }
    }
}

struct ProductListRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductListRowView(product: ListViewModel.ListProduct(id: 1, title: "Tittle", description: "llll", price: 90, rating: "3.6", thumbnail: "ll"))
    }
}
