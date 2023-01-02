//
//  HomeView.swift
//  Weather
//
//  Created by Elena Mateos López on 2/1/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            Image("Background")
                .resizable()
                .ignoresSafeArea()
            Image("House")
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.top, 257)
            VStack{
                Text("Montreal")
                    .font(.largeTitle)
                VStack(alignment: .center) {
                    Text("19º" + "\n" + "Mostly Clear")
                       
                    Text("H:24º L:18º")
                        .font(.title3.weight(.semibold))
                }
                Spacer()
            }
            .padding(.top, 51)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}
