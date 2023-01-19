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
