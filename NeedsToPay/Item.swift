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
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
