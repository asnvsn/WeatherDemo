//
//  WelcomeViews.swift
//  WeatherDemo
//
//  Created by Санжар Асанов on 21/2/23.
//

import SwiftUI
import CoreLocationUI

struct WelcomeViews: View {
    @EnvironmentObject var locationManager : LocationManager
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Welcome the Weather App")
                    .bold()
                    .font(.title)
                
                Text("Please share your current location to get the weather in your ares")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct WelcomeViews_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeViews()
    }
}
