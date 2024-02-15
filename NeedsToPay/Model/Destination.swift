//
//  Item.swift
//  NeedsToPay
//
//  Created by Hari Rait on 17.12.23.
//

import Foundation
import SwiftData

@Model
class Destination {
    var name: String
    var details: String
    var date: Date
    var priority: Int
    @Relationship(deleteRule: .cascade) var personen = [Personen]()
    @Relationship(deleteRule: .cascade) var kosten = [Kosten]()
    @Attribute(.externalStorage) var image: Data?

    init(name: String = "", details: String = "", date: Date = .now, priority: Int = 2) {
        self.name = name
        self.details = details
        self.date = date
        self.priority = priority
    }
}
