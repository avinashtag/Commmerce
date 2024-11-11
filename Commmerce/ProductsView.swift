//
//  ProductsView.swift
//  Commmerce
//
//  Created by Avinash on 11/11/2024.
//

import SwiftUI

enum CommerceError: Error{
    case invalidURL
    
    var localizedDescription: String{
        switch self {
        case .invalidURL: return "Invalid URL."
        }
    }
}

struct ProductsView: View {
    
    
    @State var products: [Product] = []
    
    func loadProducts() throws -> [Product]{
        
        guard let url =  Bundle.main.url(forResource: "Products", withExtension: "json") else { throw CommerceError.invalidURL }
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode([Product].self, from: data)
    }
    
    var body: some View {
        Text("Product, View!")
    }
}

#Preview {
    ProductsView()
}
