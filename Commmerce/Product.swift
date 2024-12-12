// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let product = try? JSONDecoder().decode(Product.self, from: jsonData)

import Foundation
import SwiftData

// MARK: - ProductElement
@Model
class Product: Codable, Hashable {
    static func == (lhs: Product, rhs: Product) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    
    var id: Int
    var title: String
    var price: Double
    var desc: String
    var category: Category
    var image: String
    var rating: Rating
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case price
        case desc = "description"
        case category
        case image
        case rating
    }
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        price = try container.decode(Double.self, forKey: .price)
        desc = try container.decode(String.self, forKey: .desc)
        category = try container.decode(Category.self, forKey: .category)
        image = try container.decode(String.self, forKey: .image)
        rating = try container.decode(Rating.self, forKey: .rating)
    }

    func encode(to encoder: any Encoder) throws {
        //Posting api
        var container = try encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeIfPresent(self.price, forKey: .price)
    }

    
    static func loadProducts() throws -> [Product]{
        
        guard let url =  Bundle.main.url(forResource: "Products", withExtension: "json") else { throw CommerceError.invalidURL }
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode([Product].self, from: data)
    }
    
    static func loadProducts1() throws -> [Product]{

        guard let url =  Bundle.main.url(forResource: "Products", withExtension: "json") else { throw CommerceError.invalidURL }
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode([Product].self, from: data)
    }
    
    static func loadProducts2() throws -> [Product]{

        guard let url =  Bundle.main.url(forResource: "Products", withExtension: "json") else { throw CommerceError.invalidURL }
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode([Product].self, from: data)
    }

    static func loadProducts3() throws -> [Product]{

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

