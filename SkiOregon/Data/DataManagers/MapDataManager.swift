//
//  MapDataManager.swift
//  SkiOregon
//
//  Created by Oscar Epp on 4/13/24.
//

import Foundation
import SwiftUI
import CoreLocation

class MapData: ObservableObject {
    @Published var mountains: [Mountain] = []
    
    init() {
        load()
    }
    
    func load() {
        guard let url = Bundle.main.url(forResource: "MapData", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            print("Failed to load MapData.json from bundle.")
            return
        }
        
        let decoder = JSONDecoder()
        if let jsonData = try? decoder.decode([Mountain].self, from: data) {
            self.mountains = jsonData
        } else {
            print("Failed to decode MapData.json")
        }
    }
    
    func toggleFavorite(for mountainId: Int) {
        if let index = mountains.firstIndex(where: { $0.id == mountainId }) {
            mountains[index].isFavorite.toggle()
        }
    }
}
struct Mountain: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var description: String
    var isFavorite: Bool
    
    /// Coordinate Struct
    var coordinates: Coordinates
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
}
