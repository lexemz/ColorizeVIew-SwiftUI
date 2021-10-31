//
//  SlidersForRGBChannel.swift
//  ColorizedView
//
//  Created by Igor on 31.10.2021.
//

import SwiftUI

struct SlidersForRGBChannel: View {
    @Binding var red: Double
    @Binding var green: Double
    @Binding var blue: Double

    var body: some View {
        VStack {
            ColorChannelSlider(value: $red, color: .red)
            ColorChannelSlider(value: $green, color: .green)
            ColorChannelSlider(value: $blue, color: .blue)
        }
    }
}

struct ColorChannelSlider: View {
    @Binding var value: Double

    let color: Color

    var body: some View {
        HStack {
            Text("0")
                .foregroundColor(.white)
            Slider(value: $value, in: 0 ... 255, step: 1)
                .tint(color)

            Text("255")
                .foregroundColor(.white)

            ColorChannelTextField(value: $value)
        }
    }
}

struct ColorChannelTextField: View {
    @Binding var value: Double

    var body: some View {
        TextField("", value: $value, formatter: NumberFormatter())
            .cornerRadius(10)
            .multilineTextAlignment(.center)
            .frame(width: 65)
            .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
            .overlay(Capsule().stroke(lineWidth: 2))
            .foregroundColor(.white)
            .keyboardType(.decimalPad)
    }
}

struct SlidersForRGBChannel_Previews: PreviewProvider {
    let value = 60
    static var previews: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            
            VStack(spacing: 100) {
                SlidersForRGBChannel(red: .constant(60), green: .constant(60), blue: .constant(60))
                ColorChannelSlider(value: .constant(60), color: .cyan)
                ColorChannelTextField(value: .constant(60))
            }
        }
    }
}
