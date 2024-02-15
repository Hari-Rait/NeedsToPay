//
//  ContentView2.swift
//  NeedsToPay
//
//  Created by Hari Rait on 05.01.24.
//

import SwiftUI

struct MainView: View {
    /// Popup für die erste Anmeldung
    @AppStorage("isFirstTime") private var isFirstTime: Bool = true
    
    /// Active Tab View
    //@State private var activeTab: Tab = .destination
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Sent", systemImage: "tray.and.arrow.up.fill")
                }
        }
        .sheet(isPresented: $isFirstTime, content: {
            IntroScreen()
                .interactiveDismissDisabled()
        })
    }
}

#Preview {
    MainView()
}
