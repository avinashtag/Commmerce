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
    
    @State var title: String = "Products"
        
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(products, id:\.self) { product in
                    
                    NavigationLink(destination: ProductDetailView(product: Binding(get: {product}, set: {_ in }), title: $title, didTappedOnClosure: { message in
                       
                        
                        print(message)
                    })) {
                        
                        HStack(alignment: .top, spacing: 20, content: {
                            
                            AsyncImage(url: URL(string: product.image)) { image in
                                image
                                    .resizable()
                                    .frame(width: 100, height:  100)
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 100, height:  100)
                            }
                            VStack{
                                Text(product.title)
                                    .font(.title3)
                                Text(product.description)
                                    .font(.body)
                            }
                        })
                    }
                }
            }
            .navigationTitle(title)
        }
        .task {
            do{
                products = try Product.loadProducts()

            }
            catch{
                print(error.localizedDescription)
            }
            
            NotificationCenter.default.addObserver(forName: Notification.paymentSuccess, object: nil, queue: nil) { notification in
                //Here you can write the code after your notification
                
                
                print("payment success")
            }

            
        }
        
    }
}

#Preview {
    ProductsView()
}


/*Closure
 
 Block of code which can be used as
 -Parameter
 -function
 -callbacks
 
 
 */
