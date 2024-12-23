//
//  TabBarView.swift
//  Commmerce
//
//  Created by Avinash on 11/11/2024.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        
        TabView {
            ProductsView()
                .tabItem {
                    VStack(content: {
                        Image(systemName: "list.dash")
                        Text("Products")
                    })
                }
            
            CartView()
                .tabItem {
                    VStack(content: {
                        Image(systemName: "cart")
                        Text("Cart")
                    })
                }
            
            //TODO: Add Third Tab as Profile "person"
            
            ProfileView()
                .tabItem {
                    VStack(content: {
                        Image(systemName: "person")
                        Text("Profile")
                    })
                }
            
            ProductMapView()
                .tabItem {
                    VStack(content: {
                        Image(systemName: "map")
                        Text("Map")
                    })
                }
        }
    }
}

#Preview {
    TabBarView()
}
