//
//  ForecastView.swift
//  Weather
//
//  Created by Elena Mateos López on 5/1/23.
//

import SwiftUI

struct ForecastView: View {
    var bottomSheetTranslationProrated: CGFloat = 1
    @State private var selection = 0

    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // MARK: Segmented control
                SegmentedControl(selection: $selection)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        if selection == 0 {
                            ForEach(Forecast.hourly) { forecast in
                                ForecastCard(forecast: forecast, forecastPeriod: .hourly)
                            }
                            .transition(.offset(x: -430))
                        } else {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                ForEach(Forecast.daily) { forecast in
                                    ForecastCard(forecast: forecast, forecastPeriod: .daily)
                                }
                            }
                            .transition(.offset(x: 430))
                        }
                    }
                    .padding(.vertical, 20)                }
            }
            .padding(.horizontal, 20)
            // MARK: Forecast Widgets (just an image)
            Image("Forecast Widgets")
                .opacity(bottomSheetTranslationProrated)
        }
//        .background(Blur(radius: 25, opaque: true))
        // Using view customs extension backgroundBlur
        .backgroundBlur(radius: 25, opaque: true)
        .background(Color.bottomSheetBackground)
        // In light mode don't looks nice. For this we make own custom blur
//        .background(.ultraThinMaterial)
        
        .clipShape(
            RoundedRectangle(cornerRadius: 44)
        )
        // MARK: Inner Shadow with custom extension View
        .innerShadow(shape: RoundedRectangle(cornerRadius: 44), color: Color.bottomSheetBorderMiddle, lineWidth: 1, offsetX: 0, offsetY: 1, blur: 0, blendMode: .overlay, opacity: 1 - bottomSheetTranslationProrated)
        .overlay {
            // MARK: Bottom Sheet Separator
            Divider()
                .blendMode(.overlay)
                .background(Color.bottomSheetBorderTop)
                .frame(maxHeight: .infinity, alignment: .top)
                .clipShape(RoundedRectangle(cornerRadius: 44))
        }
        .overlay {
            // MARK: Drag Indicator
            RoundedRectangle(cornerRadius: 10)
                .fill(.black.opacity(0.3))
                .frame(width: 48, height: 5)
                .frame(height: 20)
                .frame(maxHeight: .infinity, alignment: .top)
        }
    }
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView()
        .background(Color.background)
        .preferredColorScheme(.dark)
    }
}
