//
//  CommmerceApp.swift
//  Commmerce
//
//  Created by Avinash on 11/11/2024.
//

import SwiftUI
import SwiftData

@main
struct CommmerceApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Product.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            TabBarView().task {
                let s = Settings.shared
                print(s.user)
            }
        }
        .modelContainer(sharedModelContainer)
    }
}
