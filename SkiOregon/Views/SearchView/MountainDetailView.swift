//
//  MountainDetailView.swift
//  SkiOregon
//
//  Created by Oscar Epp on 4/13/24.
//

import SwiftUI

struct MountainDetailView: View {
    var mountain: Mountain

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(mountain.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text(mountain.description)
                    .font(.body)

                Text("Latitude: \(mountain.coordinates.latitude)")
                Text("Longitude: \(mountain.coordinates.longitude)")
            }
            .padding()
        }
        .navigationTitle("Mountain Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}


//#Preview {
//    MountainDetailView()
//}
