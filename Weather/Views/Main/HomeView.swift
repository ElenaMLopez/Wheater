//
//  HomeView.swift
//  Weather
//
//  Created by Elena Mateos López on 2/1/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                Image("Background")
                    .resizable()
                    .ignoresSafeArea()
                Image("House")
                    .frame(maxHeight: .infinity, alignment: .top)
                    .padding(.top, 257)
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
                TabBar(action: {})
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
