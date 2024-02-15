//
//  Namen.swift
//  NeedsToPay
//
//  Created by Hari Rait on 17.12.23.
//

import SwiftUI
import SwiftData

@Model
class Personen: Identifiable {
    var id: UUID = UUID()
    var name: String
    var bestellung: [String] = []
    var destination: Destination?
    @Relationship(deleteRule: .cascade) var kosten = [Kosten]()
    //@Published var selectedKosten: Kosten?

    init(id: UUID, name: String = "", destination: Destination? = nil, kosten: [Kosten] = [Kosten]()) {
        self.id = id
        self.name = name
        self.destination = destination
        self.kosten = kosten
    }
}
