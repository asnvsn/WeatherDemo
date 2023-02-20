//
//  ContentView.swift
//  WeatherDemo
//
//  Created by Санжар Асанов on 21/2/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherMangaer = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                } else {
                    LoadingView()
                        .task {
                            do {
                                weather = try await weatherMangaer.getCurrentWeather(latitude: location.latitude, longtitude: location.longitude)
                                
                            } catch {
                                print("Error getting weather: \(error)")
                            }
                        }
                }
                     } else {
                         if locationManager.isLoading {
                        LoadingView()
                    } else {
                        WelcomeViews()
                            .environmentObject(locationManager)
                    }
                }
        }
        .background(Color(hue: 0.62, saturation: 0.618, brightness: 0.348))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
