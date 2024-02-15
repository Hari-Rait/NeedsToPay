//
//  IntroScreen.swift
//  NeedsToPay
//
//  Created by Hari Rait on 05.01.24.
//

import SwiftUI

struct IntroScreen: View {
    /// Visibility Status
    @AppStorage("isFirstTime") private var isFirstTime: Bool = true

    var body: some View {
        VStack(spacing: 15) {
            Text("Willkommen\n Was die App alles bietet")
                .font(.largeTitle.bold())
                .multilineTextAlignment(.center)
                .padding(.top, 65)
                .padding(.bottom, 35)
            
            /// Points View
            VStack(alignment: .leading, spacing: 25, content: {
                PointView(symbol: "person.3", title: "Personen hinzufügen", subTitle: "Füge Personen Hinzu.")
                
                PointView(symbol: "cart", title: "Bestellungen", subTitle: "Füge Bestellungen hinzu die Ihr bestellt habt.")
                
                PointView(symbol: "bonjour", title: "Bestellung auswählen", subTitle: "Wähle die Bestellung die du bestellt hast.")
            })
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 15)
            
            Spacer(minLength: 10)
            
            Button(action: {
                isFirstTime = false
            }, label: {
                Text("Weiter")
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(appTint.gradient, in: .rect(cornerRadius: 12))
                    .contentShape(.rect)
            })
        }
        .padding(15)
    }
    
    /// Point View
    @ViewBuilder
    func PointView(symbol: String, title: String, subTitle: String) -> some View {
        HStack(spacing: 20) {
            Image(systemName: symbol)
                .font(.largeTitle)
                .foregroundStyle(appTint.gradient)
                .frame(width: 45)
            
            VStack(alignment: .leading, spacing: 6, content: {
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Text(subTitle)
                    .font(.callout)
                    .foregroundStyle(.gray)
            })
        }
    }
}

#Preview {
    IntroScreen()
}
