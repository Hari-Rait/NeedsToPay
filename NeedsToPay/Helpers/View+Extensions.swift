//
//  View+Extenstions.swift
//  NeedsToPay
//
//  Created by Hari Rait on 18.12.23.
//

import SwiftUI

var currencySymbol: String {
    let locale = Locale.current
    
    return locale.currencySymbol ?? ""
}
