// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let product = try? JSONDecoder().decode(Product.self, from: jsonData)

import Foundation

// MARK: - ProductElement
struct Product: Codable, Hashable {
    static func == (lhs: Product, rhs: Product) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    
    var id: Int
    var title: String
    var price: Double
    var description: String
    var category: Category
    var image: String
    var rating: Rating
    
    static func loadProducts() throws -> [Product]{
        
        guard let url =  Bundle.main.url(forResource: "Products", withExtension: "json") else { throw CommerceError.invalidURL }
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode([Product].self, from: data)
    }

}

enum Category: String, Codable {
    case electronics = "electronics"
    case jewelery = "jewelery"
    case menSClothing = "men's clothing"
    case womenSClothing = "women's clothing"
}

// MARK: - Rating
struct Rating: Codable {
    var rate: Double
    var count: Int
}

