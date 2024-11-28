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
    @Binding var title: String

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
                title = "Hi! I tapped on closure button"
                didTappedOnClosure("Hi! I tapped on closure button")
            }, label: {
                Label("Closure", systemImage: "ellipsis.curlybraces")
            })
            Spacer()
        })
        .padding()
        .navigationTitle("Product Detail")
        .task {
            
            
            
            let notificationOne = NotificationCenter() //New memory
            let notificationTwo = NotificationCenter.default //  Shared Memory
            
            
            NotificationCenter.default.addObserver(forName: Notification.paymentSuccess, object: nil, queue: nil) { notification in
                //Here you can write the code after your notification
                
                
                print("payment success")
            }
        }

    }
}

#Preview {
    
    ProductDetailView(product: Binding(get: {
        try! Product.loadProducts()[0]
    }, set: {_ in }), title: Binding(get: {
        ""
    }, set: {_ in }), didTappedOnClosure: { _ in
        
    })
}
