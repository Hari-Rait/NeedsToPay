//
//  NeedsToPayApp.swift
//  NeedsToPay
//
//  Created by Hari Rait on 17.12.23.
//

import SwiftUI
import SwiftData

@main
struct NeedsToPayApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .tabItem {
                        Label("Orte", systemImage: "map")
                    }
                
                PersonenView()
                    .tabItem {
                        Label("Personen", systemImage: "person")
                    }
            }
        }
        .modelContainer(for: Destination.self)
    }
}
