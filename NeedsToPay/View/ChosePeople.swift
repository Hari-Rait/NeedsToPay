//
//  ChosePeople.swift
//  NeedsToPay
//
//  Created by Hari Rait on 25.12.23.
//

import SwiftUI

struct ChosePeople: View {
    @Bindable var destination: Destination
    @State private var peopleSelection = Set<String>()
    
    @State private var kostenAuswahl: Kosten?
    
    
    var body: some View {
        NavigationStack {
            List(destination.kosten, id: \.self, selection: $kostenAuswahl) { kosten in
                Text(kosten.name).tag(kosten as Kosten?)
            }
            .toolbar {
                EditButton()
            }
        }
    }
}

//#Preview {
//    ChosePeople()
//}
