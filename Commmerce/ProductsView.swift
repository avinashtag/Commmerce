//
//  ProductsView.swift
//  Commmerce
//
//  Created by Avinash on 11/11/2024.
//

import SwiftUI
import SwiftData

enum CommerceError: Error{
    case invalidURL
    
    var localizedDescription: String{
        switch self {
        case .invalidURL: return "Invalid URL."
        }
    }
}

struct ProductsView: View {
    
    
    @Query var products: [Product]
    @Environment(\.modelContext) private var modelContext

    @State var title: String = "Products"
    
    let queue = DispatchQueue(label: "Products", attributes: .concurrent)
    let dispactchGroup: DispatchGroup = DispatchGroup()
    
    
    let operation1 : BlockOperation = BlockOperation {
        print("API 1")
        do{
            let products = try Product.loadProducts()
        }
        catch{
            print(error.localizedDescription)
        }

    }
    
    let operation2 : BlockOperation = BlockOperation {
        print("API 2")
        do{
            let products = try Product.loadProducts()
        }
        catch{
            print(error.localizedDescription)
        }

    }

        
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
                                Text(product.desc)
                                    .font(.body)
                            }
                        })
                    }
                }
            }
            .navigationTitle(title)
        }
        .task {
            
//            operation1.addDependency(operation2)
//            operation1.start()
//            operation2.start()
            
            if products.count == 0 {
                //                queue.async {
                do{
                    
                    let products = try await Product.loadProducts()
                    //Insert product in db
                    for product in products {
                        self.modelContext.insert(product)
                        
                        //To Delete product
                        // self.modelContext.delete(product)
                        
                        //To update
                        //                        product.price = 20
                        //                        try? self.modelContext.save()
                    }
                    
                }
                catch{
                    print(error.localizedDescription)
                }
            }
//            }

           /* dispactchGroup.enter()
            queue.async {
                print("API 1")
                try? Product.loadProducts1()
                dispactchGroup.leave()
            }
            
            dispactchGroup.enter()
            queue.async {
                print("API 2")
                try? Product.loadProducts2()
                dispactchGroup.leave()
            }
            
            dispactchGroup.enter()
            queue.async {
                print("API 3")
                try? Product.loadProducts3()
                dispactchGroup.leave()
            }
            
            dispactchGroup.notify(queue: .main){
                print("All Api Done")
            }
*/
            
            DispatchQueue.main.async {
                //this will be in main thread 
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
