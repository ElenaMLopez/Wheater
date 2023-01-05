//
//  HomeView.swift
//  Weather
//
//  Created by Elena Mateos López on 2/1/23.
//

import SwiftUI
import BottomSheet

// Add a Bottom Sheet from library: https://github.com/Wouter125/BottomSheet

enum BottomSheetPosition: CGFloat, CaseIterable {
    case middle = 0.385 // container height in design / screen height in design (325/844)
    case top = 0.831 // container height in design / screen height in design (702/844)
}

struct HomeView: View {
    @State var bottomSheetPosition: BottomSheetPosition = .middle
    
    var body: some View {
        NavigationView {
            ZStack {
                // MARK: Backround Color
                Color.background
                    .ignoresSafeArea()
                // MARK: Background Image
                Image("Background")
                    .resizable()
                    .ignoresSafeArea()
                // MARK: House Image
                Image("House")
                    .frame(maxHeight: .infinity, alignment: .top)
                    .padding(.top, 257)
                // MARK: Weather Data
                VStack(spacing:  -10){
                    Text("Montreal")
                        .font(.largeTitle)
                    VStack(alignment: .center) {
                        Text(attributtedString)
                        Text("H:24º L:18º")
                            .font(.title3.weight(.semibold))
                    }
                    Spacer()
                }
                .padding(.top, 51)
                // MARK: Bottom Sheet
                BottomSheetView(position: $bottomSheetPosition) {
//                    Text(bottomSheetPosition.rawValue.formatted())
                } content: {
                    ForecastView()
                }

                // MARK: Tab Bar
                TabBar(action: {
                    bottomSheetPosition = .top
                })
            }
            .navigationBarHidden(true)
        }
    }
    
    /**
        How to use AttributedString to style block of text with different styles,
     including optional tex like a pipe in this example.
     */
    private var attributtedString: AttributedString {
        var string = AttributedString("19º" + "\n " + "Mostly Clear")
        
        if let temp = string.range(of: "19º") {
            string[temp].font = .system(size: 96, weight: .thin)
            string[temp].foregroundColor = .primary
        }
        // pipe don't exist now in our initial string, but can do it in future
        if let pipe = string.range(of: " | ") {
            string[pipe].font = .title3.weight(.semibold)
            string[pipe].foregroundColor = .secondary
        }
        if let weather = string.range(of: "Mostly Clear") {
            string[weather].font = .title3.weight(.semibold)
            string[weather].foregroundColor = .secondary
        }
        
        return string
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}
