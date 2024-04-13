//
//  SearchView.swift
//  SkiOregon
//
//  Created by Oscar Epp on 4/13/24.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var mapDataLocal: MapData
    @State private var searchQuery = ""

    var filteredMountains: [Mountain] {
        let sortedMountains = mapDataLocal.mountains.sorted {
            ($0.isFavorite && !$1.isFavorite) ? true : false
        }
        if searchQuery.isEmpty {
            return sortedMountains
        } else {
            return sortedMountains.filter { mountain in
                mountain.name.localizedCaseInsensitiveContains(searchQuery)
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(filteredMountains, id: \.id) { mountain in
                    NavigationLink(destination: MountainDetailView(mountain: mountain)) {
                        MountainRowView(mountain: mountain)
                    }
                }
            }
            .navigationTitle("Search")
            .searchable(text: $searchQuery, placement: .navigationBarDrawer(displayMode: .always))
        }
    }
}

#Preview {
    SearchView()
        .environmentObject(MapData())
}
