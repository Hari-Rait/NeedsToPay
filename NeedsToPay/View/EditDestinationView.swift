//
//  EditDestinationView.swift
//  NeedsToPay
//
//  Created by Hari Rait on 17.12.23.
//

import PhotosUI
import SwiftUI
import SwiftData

struct EditDestinationView: View {
    @Environment(\.modelContext) private var modelContext
    @Bindable var destination: Destination
    
    @State private var newPersonName = ""
    @State private var newKostenName = ""
    @State private var newKostenBeitrag: Double = .zero
    @State private var newKostenAnzahl = ""
    
    @State private var photosItem: PhotosPickerItem?
    
    // For the Popup View
    @State private var showingPopover = false
    
    @State private var kostenAuswahl: Kosten?
    
    @State private var kostenWählen = Array(repeating: 0, count: 3)
    
    @State private var selectedKosten = Set<UUID>()
    
    var body: some View {
        
        Form {
            Section {
                if let imageData = destination.image {
                    if let image = UIImage(data: imageData) {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                    }
                }
                PhotosPicker("Füge ein Foto hinzu", selection: $photosItem, matching: .images)
            }
            
            
            TextField("Ort", text: $destination.name)
            TextField("Beschreibung", text: $destination.details, axis: .vertical)
            DatePicker("Datum", selection: $destination.date)
                .datePickerStyle(.graphical)
                .background(.background, in: .rect(cornerRadius: 10))
                .accentColor(.purple)
            
            Section("Personen") {
                HStack {
                    TextField("Füge eine Person hinzu:", text: $newPersonName)
                    
                    Button("Hinzufügen", action: addSight)
                        .foregroundStyle(.purple)
                }
                List {
                    ForEach(destination.personen) { personen in
                        NavigationLink() {
                            //List {
                                List(destination.kosten, selection: $selectedKosten) { kosten in
                                    HStack{
                                        Text(kosten.name).tag(kosten.self)
                                        Text(kosten.anzahl)
                                    }
                                }
                            Text("\(selectedKosten.count) ausgewählt")
                            //}
                        } 
                        label: {
                            Text(personen.name)
                        }
                    }
                    .onDelete(perform: deletePersonen)
                }
            }
            
            Section("Währung") {
                Picker("Währung", selection: $destination.priority) {
                    Image(systemName: "dollarsign").tag(1)
                    Image(systemName: "eurosign").tag(2)
                    Image(systemName: "bitcoinsign").tag(3)
                }
                .pickerStyle(.segmented)
            }
            
            Section("Bestellungen") {
                TextField("Füge eine Bestellung hinzu:", text: $newKostenName)
                
                HStack {
                    if destination.priority == 1 {
                        Image(systemName: "dollarsign")
                    }
                    else if destination.priority == 2 {
                        Image(systemName: "eurosign")
                    }
                    else {
                        Image(systemName: "bitcoinsign")
                    }
                    
                    TextField("", value: $newKostenBeitrag, formatter: numberFormatter)
                        .keyboardType(.decimalPad)
                    
                    TextField("Anzahl:", text: $newKostenAnzahl)
                        .keyboardType(.numberPad)
                }
                
                Button("Hinzufügen", action: addKosten)
                    .foregroundStyle(.purple)
                
                ForEach(destination.kosten, id: \.self) { kosten in
                    VStack (alignment: .leading) {
                        Text(kosten.name)
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        Text("Anzahl: \(kosten.anzahl)")
                        HStack {
                            Text("Beitrag pro Bestelllung: \(kosten.beitrag, specifier: "%.0f")")
                            
                            if destination.priority == 1 {
                                Image(systemName: "dollarsign")
                            }
                            else if destination.priority == 2 {
                                Image(systemName: "eurosign")
                            }
                            else {
                                Image(systemName: "bitcoinsign")
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle(destination.name)
        .navigationBarTitleDisplayMode(.inline)
        .onChange(of: photosItem) {
            Task {
                destination.image = try? await photosItem?.loadTransferable(type: Data.self)
            }
        }
        .toolbar {
            EditButton()
        }
    }
    
    func addSight() {
        guard newPersonName.isEmpty == false else { return }
        
        withAnimation {
            let person = Personen(id: UUID(), name: newPersonName)
            destination.personen.append(person)
            newPersonName = ""
        }
    }
    
    func addKosten() {
        /// Um Kosten hinzuzufügen
        guard newKostenName.isEmpty == false else { return }
        guard newKostenAnzahl.isEmpty == false else { return }
        
        withAnimation {
            let kosten = Kosten(name: newKostenName, beitrag: newKostenBeitrag, anzahl: newKostenAnzahl)
            destination.kosten.append(kosten)
            newKostenName = ""
            newKostenBeitrag = .zero
            newKostenAnzahl = ""
        }
    }
    /// um die Person zu löschen
    func deletePersonen(_ indexSet: IndexSet) {
        for index in indexSet {
            let personen = destination.personen[index]
            modelContext.delete(personen)
        }
        
        destination.personen.remove(atOffsets: indexSet)
    }
    
    /// Number Formatter
    var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        
        return formatter
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
        return Text("Failes to create container: \(error.localizedDescription)")
    }
}

