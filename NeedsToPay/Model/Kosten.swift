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
//    var beitrag: String
//    var anzahl: String
    
//    init(name: String, beitrag: String, anzahl: String) {
//        self.name = name
//        self.beitrag = beitrag
//        self.anzahl = anzahl
//    }
    
    init(name: String) {
        self.name = name
    }
}
