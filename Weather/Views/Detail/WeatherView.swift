//
//  WeatherView.swift
//  Weather
//
//  Created by Elena Mateos López on 19/1/23.
//

import SwiftUI

struct WeatherView: View {
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            // MARK: Weather Widgets
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    ForEach(Forecast.cities) { forecast in
                        WeatherWidget(forecast: forecast)
                        
                    }
                }
            }
            .safeAreaInset(edge: .top) {
//                Color.clear (this works too)
                EmptyView()
                    .frame(height: 110)
            }
        }
        .overlay {
            NavigationBar()
        }
        .navigationBarHidden(true)
        
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
            .preferredColorScheme(.dark)
    }
}
