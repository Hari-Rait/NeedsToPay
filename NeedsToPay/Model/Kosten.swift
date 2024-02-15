//
//  Kosten.swift
//  NeedsToPay
//
//  Created by Hari Rait on 18.12.23.
//

import SwiftUI
import SwiftData

@Model
class Kosten {
    var name: String
    var beitrag: Double
    var anzahl: String
    var destination: Destination?
    var personen: Personen?

    init(name: String, beitrag: Double, anzahl: String, destination: Destination? = nil, personen: Personen? = nil) {
        self.name = name
        self.beitrag = beitrag
        self.anzahl = anzahl
        self.destination = destination
        self.personen = personen
    }
}
