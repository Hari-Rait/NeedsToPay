//
//  PeopleView.swift
//  NeedsToPay
//
//  Created by Hari Rait on 21.12.23.
//

import SwiftUI
import SwiftData

struct PeopleView: View {
    @Bindable var personen: Personen
    @Query private var kosten: [Kosten]
    
    @State private var kostenAuswahl: Kosten?
    
    var body: some View {
        NavigationStack {
            List(personen.kosten, id: \.self, selection: $kostenAuswahl) { kosten in
                Text(kosten.name).tag(kosten as Kosten?)
            }
            .toolbar {
                EditButton()
            }
            
        }
    }
}

