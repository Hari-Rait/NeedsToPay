//
//  KostPickView.swift
//  NeedsToPay
//
//  Created by Hari Rait on 15.02.24.
//

import SwiftUI
import SwiftData

struct KostPickView: View {
    @Query var destinationkosten: [Destination]
    @Query var kostens: [Kosten]
    private let destinations: Destination
    
    var body: some View {
        List {
            ForEach(destinations.kosten) { kosten in
                Text(kosten.name)
            }
        }
    }
}
