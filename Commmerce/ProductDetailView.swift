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
        Text(product.description)
            .navigationTitle("Product Detail")
    }
}

//#Preview {
//    ProductDetailView()
//}
