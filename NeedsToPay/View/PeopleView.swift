//
//  PeopleView.swift
//  NeedsToPay
//
//  Created by Hari Rait on 21.12.23.
//

import SwiftUI

struct PeopleView: View {
    @Bindable var personen: Personen
    
    var body: some View {
        Text(personen.name)
        
        
    }
}

