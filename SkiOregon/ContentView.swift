//
//  ContentView.swift
//  SkiOregon
//
//  Created by Oscar Epp on 4/13/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        TabView{
            
//            WeatherRowView()
//                .tabItem {
//                    Label("Weather", systemImage: "cloud.snow.fill")
//                }
            
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }

            MapView()
                .tabItem {
                    Label("Map", systemImage: "map")
                }
            
            Text("Hello, World!")
                .tabItem {
                    Label("Profile", systemImage: "figure.skiing.downhill")
                }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(MapData())

}
