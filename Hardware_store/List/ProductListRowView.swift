//
//  ProductListRow.swift
//  Hardware_store
//
//  Created by Yuliya Ratkevcih on 23.11.22.
//

import SwiftUI


struct ProductListRowView: View {
    let product: ListViewModel.ListProduct
  
    
    
    private let currency = "$"
    
    var body: some View {
        HStack {
        VStack {
            Text("\(product.title)")
                .font(.largeTitle)
            AsyncImage(url: URL(string: product.thumbnail), content: { image in
                image
                    .resizable()
                    .scaledToFit()
            }, placeholder: {
                ProgressView()
            })
//                .frame(width: 100, height: 100)
//                .clipShape(Rectangle())
                .shadow(radius: 10)
            Text("\(product.description)")
                .lineLimit(2)
                .font(.subheadline)
            
        }
            Spacer()
            VStack {
                Text("\(product.price)" + currency)
                Text("\(product.rating)")
                
            }
            
        }
        
        
        
    }
    
//    var itemImage: some View {
//        AsyncImage(url: URL(string: product.thumbnail))
//
//    }
    
}

struct ProductListRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductListRowView(product: ListViewModel.ListProduct(id: 1, title: "Tittle", description: "llll", price: 90, rating: "3.6", thumbnail: "ll"))
    }
}
