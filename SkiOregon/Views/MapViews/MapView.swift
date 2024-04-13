//
//  MapView.swift
//  SkiOregon
//
//  Created by Oscar Epp on 4/13/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    /// MapView Starting Position
    @State private var position: MapCameraPosition = .automatic
    @EnvironmentObject var mapDataLocal: MapData

    var body: some View {
        
        /// Main Map View
        Map(position: $position) {
            ForEach(mapDataLocal.mountains, id: \.id) { mountain in
                
                Annotation(mountain.name, coordinate: mountain.locationCoordinate){
                    Image(systemName: "mountain.2.fill")
                        .padding(4)
                        .foregroundStyle(.white)
                        .background(.blue)
                        .cornerRadius(10)
                }
            }
        }
    }
}


#Preview {
    MapView()
        .environmentObject(MapData())
}

