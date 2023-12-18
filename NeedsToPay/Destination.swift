//
//  Item.swift
//  NeedsToPay
//
//  Created by Hari Rait on 17.12.23.
//

import Foundation
import SwiftData

@Model
final class Item {
    
    var Kostenname: String
    var name: String
    var preis: Int
    var währung: Int
    var offenerBeitrag: Int
    var timestamp: Date
    @Relationship(deleteRule: .cascade) var namen = [Namen]()
    
    
    init(Kostenname: String = "", name: String = "", preis: Int = 230, währung: Int = 2, offenerBeitrag: Int = 200, timestamp: Date = .now) {
        self.Kostenname = Kostenname
        self.name = name
        self.preis = preis
        self.währung = währung
        self.offenerBeitrag = offenerBeitrag
        self.timestamp = timestamp
    }
}
