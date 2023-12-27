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
            ContentView()
        }
        .modelContainer(for: Destination.self)
    }
}
