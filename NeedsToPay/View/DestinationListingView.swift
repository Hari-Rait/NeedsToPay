//
//  DestinationListingView.swift
//  NeedsToPay
//
//  Created by Hari Rait on 17.12.23.
//

import SwiftUI
import SwiftData

struct DestinationListingView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: [SortDescriptor(\Destination.priority, order: .reverse), SortDescriptor(\Destination.name)]) var destinations: [Destination]
    @Query var kosten: [Kosten]
    @Query var personen: [Personen]

    var body: some View {
        List {
            ForEach(destinations) { destination in
                NavigationLink(value: destination) {
                    VStack(alignment: .leading) {
                        HStack{
                            Text(destination.name)
                                .font(.headline)
                            
//                            Text(String(kosten.beitrag.amount))
//                                .font(.footnote)
                        }
                        Text(destination.date.formatted(date: .numeric, time: .shortened))
                            .font(.caption2)
                            .foregroundStyle(.gray)
                    }
                }
            }
            .onDelete(perform: deleteDestinations)
        }
    }

    init(sort: SortDescriptor<Destination>, searchString: String) {
        _destinations = Query(filter: #Predicate {
            if searchString.isEmpty {
                return true
            } else {
                return ($0.name.localizedStandardContains(searchString) || $0.personen.contains { $0.name.localizedStandardContains(searchString) })
            }
        }, sort: [sort])
    }

    func deleteDestinations(_ indexSet: IndexSet) {
        for index in indexSet {
            let destination = destinations[index]
            modelContext.delete(destination)
        }
    }
}

#Preview {
    DestinationListingView(sort: SortDescriptor(\Destination.name), searchString: "")
}
