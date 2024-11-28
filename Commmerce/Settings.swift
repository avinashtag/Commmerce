//
//  Settings.swift
//  Commmerce
//
//  Created by Avinash on 28/11/2024.
//

import Foundation
import SwiftUI


class Settings {
    
    
    static var shared: Settings {
        .init(apiKey: "aswiniApiKey", apiSecret: "gTasjT67", baseUrl: "http://fakestoreapi.com", user: "avinash")
    }
    
    let apiKey: String
    let apiSecret: String
    let baseUrl: String
    let theme: ColorScheme = .dark
    var user: String
    
    init(apiKey: String, apiSecret: String, baseUrl: String, user: String) {
        self.apiKey = apiKey
        self.apiSecret = apiSecret
        self.baseUrl = baseUrl
        self.user = user
    }
    
}
