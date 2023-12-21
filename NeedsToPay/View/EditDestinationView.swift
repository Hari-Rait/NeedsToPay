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
    @State private var newSightName = ""
    @State private var newKosten = ""
    @State private var newKostenZahlen = ""
    

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
                    ForEach(destination.sights) { sight in
                        
                        Text(sight.name)
                    }
                

                HStack {
                    TextField("Füge eine Person hinzu", text: $newSightName)

                    Button("Hinzufügen", action: addSight)
                }
            }
            
            Section("Kosten Hinzufügen") {
                ForEach(destination.kosten) { kosten in
                    Text(kosten.name)
                }
                
                HStack {
                    TextField("Füge deine Kosten hinzu", text: $newKosten)
                    
                    Button("Hinzufügen", action: addKosten)
                        .keyboardType(.decimalPad)
                }
                
                HStack {
                    Text(currencySymbol)
                        .font(.callout.bold())
                    
                    TextField("0.0", text: $newKostenZahlen)
                }
            }
            
        }
        .navigationTitle("Edit Destination")
        .navigationBarTitleDisplayMode(.inline)
    }

    func addSight() {
        guard newSightName.isEmpty == false else { return }

        withAnimation {
            let sight = Sight(name: newSightName)
            destination.sights.append(sight)
            newSightName = ""
        }
    }
    
    func addKosten() {
        /// Um Kosten hinzuzufügen
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

