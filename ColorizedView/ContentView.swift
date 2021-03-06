//
//  ContentView.swift
//  ColorizedView
//
//  Created by Igor on 31.10.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var redChannel = Double.random(in: 0...255)
    @State private var greenChannel = Double.random(in: 0...255)
    @State private var blueChannel = Double.random(in: 0...255)

    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()

            VStack(spacing: 16) {
                ColorizedView(red: redChannel, green: greenChannel, blue: blueChannel)
                SlidersForRGBChannel(red: $redChannel, green: $greenChannel, blue: $blueChannel)
                Spacer()
            }
            .padding()
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



