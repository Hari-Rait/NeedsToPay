//
//  View+Extenstions.swift
//  NeedsToPay
//
//  Created by Hari Rait on 18.12.23.
//

import SwiftUI

extension View {
    
    var currencySymbol: String {
        
        let locale = Locale.current
        
        return locale.currencySymbol ?? ""
    }
    
    func currencyString(_ value: Double, allowedDigits: Int = 2) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = allowedDigits
        
        return formatter.string(from: .init(value: value)) ?? ""
    }
}
