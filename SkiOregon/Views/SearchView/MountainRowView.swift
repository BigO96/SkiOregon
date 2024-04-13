//
//  MountainRow.swift
//  SkiOregon
//
//  Created by Oscar Epp on 4/13/24.
//

import SwiftUI

struct MountainRowView: View {
    @EnvironmentObject var mapData: MapData
    var mountain: Mountain
    
    var body: some View {
        HStack {
            Text(mountain.name)
                .font(.headline)
                .foregroundColor(.primary)
            
            Spacer()
            
            Button(action: {
                // Call toggleFavorite when the star is tapped
                mapData.toggleFavorite(for: mountain.id)
            }) {
                Image(systemName: mountain.isFavorite ? "star.fill" : "star")
                    .frame(width: 30, height: 30)
                    .foregroundColor(mountain.isFavorite ? .yellow : .blue)
            }
            .buttonStyle(PlainButtonStyle())
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 30, idealHeight: 30, maxHeight: 30, alignment: .leading)
        .padding(.vertical, 10)
    }
}

// Preview
struct MountainRow_Previews: PreviewProvider {
    static var previews: some View {
        MountainRowView(mountain: Mountain(
            id: 1,
            name: "Mount Hood",
            description: "Highest mountain in Oregon.",
            isFavorite: false,
            coordinates: Mountain.Coordinates(latitude: 45.3735, longitude: -121.6959)
        ))
        .environmentObject(MapData())
    }
}
