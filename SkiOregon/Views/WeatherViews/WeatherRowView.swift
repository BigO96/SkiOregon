//
//  WeatherRowView.swift
//  SkiOregon
//
//  Created by Oscar Epp on 4/13/24.
//

import SwiftUI
import WeatherKit
import CoreLocation

struct WeatherRowView: View {
    @EnvironmentObject var mapData: MapData
    var mountain: Mountain
    
    @State private var weather: CurrentWeather?
    @State private var weatherService = WeatherService.shared
    
    func loadWeather() {
        let location = CLLocation(latitude: mountain.coordinates.latitude, longitude: mountain.coordinates.longitude)
        Task {
            do {
                let weatherData = try await weatherService.weather(for: location)
                self.weather = weatherData.currentWeather
            } catch {
                print("Error fetching weather: \(error)")
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if let weather = weather {
                Text("Current Temperature: \(weather.temperature.converted(to: .celsius).value, specifier: "%.1f")°C")
                Text("Weather Condition: \(weather.condition.description)")
            } else {
                Text("Loading weather...")
            }
        }
        .onAppear {
            loadWeather()
        }
    }
}

#Preview {
    WeatherRowView(mountain: Mountain(
        id: 1,
        name: "Mount Hood",
        description: "Highest mountain in Oregon.",
        isFavorite: false,
        coordinates: Mountain.Coordinates(latitude: 45.3735, longitude: -121.6959)
    ))
    .environmentObject(MapData())
}
