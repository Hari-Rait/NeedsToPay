//
//  EditDestinationView.swift
//  NeedsToPay
//
//  Created by Hari Rait on 17.12.23.
//

import SwiftUI
import SwiftData

struct EditDestinationView: View {
    @Bindable var destination: Destination
    @State private var newPersonName = ""
    @State private var newKostenName = ""
    @State private var newKostenBeitrag = ""
    @State private var newKostenAnzahl = ""
    
    
    var body: some View {
        
        Form {
            TextField("Name", text: $destination.name)
            TextField("Details", text: $destination.details, axis: .vertical)
            DatePicker("Date", selection: $destination.date)
                .datePickerStyle(.graphical)
                .background(.background, in: .rect(cornerRadius: 10))
            
            Section("Währung") {
                Picker("Währung", selection: $destination.priority) {
                    Image(systemName: "dollarsign").tag(1)
                    Image(systemName: "eurosign").tag(2)
                    Image(systemName: "bitcoinsign").tag(3)
                }
                .pickerStyle(.segmented)
            }
            
            Section("Personen") {
                ForEach(destination.personen, id: \.self) { personen in
                    NavigationLink(destination: Text(personen.name)) {
                        PeopleView(personen: personen)
                    }
                    
                }
                
                HStack {
                    TextField("Füge eine Person hinzu", text: $newPersonName)
                    
                    Button("Hinzufügen", action: addSight)
                }
            }
            
            Section("Kosten Hinzufügen") {
                    TextField("Kosten Name", text: $newKostenName)
                    
                    HStack {
                        Text(currencySymbol)
                            .font(.callout.bold())
                        
                        TextField("0.0", text: $newKostenBeitrag)
                            .keyboardType(.decimalPad)
                        
                        TextField("Anzahl", text: $newKostenAnzahl)
                    }
                
                ForEach(destination.kosten, id: \.self) { kosten in
                    NavigationLink(destination: Text(kosten.name)) {
                        KostenView(kosten: kosten)
                    }
                    
                }
                
                
                Button("Hinzufügen", action: addKosten)
                    
            }
            
        }
        .navigationTitle("Edit Destination")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func addSight() {
        guard newPersonName.isEmpty == false else { return }
        
        withAnimation {
            let person = Personen(name: newPersonName)
            destination.personen.append(person)
            newPersonName = ""
        }
    }
    
    func addKosten() {
        /// Um Kosten hinzuzufügen
//        guard newKostenName.isEmpty == false else { return }
//        guard newKostenBeitrag.isEmpty == false else { return }
//        guard newKostenAnzahl.isEmpty == false else { return }
//        
//        withAnimation {
//            let kosten = Kosten(name: newKostenName, beitrag: newKostenBeitrag, anzahl: newKostenAnzahl)
//            destination.kosten.append(kosten)
//            newKostenName = ""
//            newKostenBeitrag = ""
//            newKostenAnzahl = ""
        
        guard newKostenName.isEmpty == false else { return }
        withAnimation {
        let kosten = Kosten(name: newKostenName)
        destination.kosten.append(kosten)
        newKostenName = ""
        
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Destination.self, configurations: config)
        let example = Destination(name: "Tacco Laden", details: "Tacco Laden mit der Truppe.")
        return EditDestinationView(destination: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}

