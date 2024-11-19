//
//  ProductDetailView.swift
//  Commmerce
//
//  Created by Avinash on 14/11/2024.
//

import SwiftUI

//Assigment 14 nov

struct ProductDetailView: View {
    @Binding var product: Product

    var body: some View {
        VStack(alignment: .center, spacing: 10, content: {
            AsyncImage(url: URL(string: product.image)) { image in
                image
                    .resizable()
                    .frame(width: 200, height:  200)
            } placeholder: {
                ProgressView()
                    .frame(width: 200, height:  200)
            }
            
            Text(product.title)
                .font(.title2)
            
            Text(product.description)
                .font(.body)
            
            Spacer()
        })
        .padding()
        .navigationTitle("Product Detail")

    }
}

#Preview {
    
    ProductDetailView(product: Binding(get: {
        try! Product.loadProducts()[0]
    }, set: {_ in }))
}
