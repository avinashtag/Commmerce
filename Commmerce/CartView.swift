//
//  CartView.swift
//  Commmerce
//
//  Created by Avinash on 11/11/2024.
//

import SwiftUI

struct CartView: View {
    var body: some View {
        Text("Cart, View!")
    }
    
    func payment() {
        NotificationCenter.default.post(Notification(name: Notification.paymentSuccess))
    }
}

#Preview {
    CartView()
}
