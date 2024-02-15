//
//  PersonenView.swift
//  NeedsToPay
//
//  Created by Hari Rait on 15.02.24.
//

import SwiftUI
import SwiftData

struct PersonenView: View {
    @Query(sort: \Personen.name) var personen: [Personen]
    
    var body: some View {
        NavigationStack {
            List(personen) { personen in
                NavigationLink(value: personen.destination) {
                    Text(personen.name)
                }
            }
            .navigationTitle("Personen")
            .navigationDestination(for: Destination.self, destination: EditDestinationView.init)
        }
    }
}

#Preview {
    PersonenView()
}
