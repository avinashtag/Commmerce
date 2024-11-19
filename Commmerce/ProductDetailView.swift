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
    
    var didTappedOnClosure: (String)->Void

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
            
            Spacer(minLength: 20)
            Button(action: {
                didTappedOnClosure("Hi! I tapped on closure button")
            }, label: {
                Label("Closure", systemImage: "ellipsis.curlybraces")
            })
            Spacer()
        })
        .padding()
        .navigationTitle("Product Detail")

    }
}

#Preview {
    
    ProductDetailView(product: Binding(get: {
        try! Product.loadProducts()[0]
    }, set: {_ in }), didTappedOnClosure: { _ in
        
    })
}
