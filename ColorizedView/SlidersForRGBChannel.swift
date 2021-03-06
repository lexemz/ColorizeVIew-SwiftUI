//
//  SlidersForRGBChannel.swift
//  ColorizedView
//
//  Created by Igor on 31.10.2021.
//

import SwiftUI

struct SlidersForRGBChannel: View {
    private enum Field {
        case red
        case green
        case blue
    }

    @Binding var red: Double
    @Binding var green: Double
    @Binding var blue: Double
    
    @FocusState private var focusedField: Field?

    var body: some View {
        HStack(spacing: 20) {
            VStack {
                ColorChannelSlider(value: $red, color: .red, tapOnSliderEvent: hideKeyboard)
                ColorChannelSlider(value: $green, color: .green, tapOnSliderEvent: hideKeyboard)
                ColorChannelSlider(value: $blue, color: .blue, tapOnSliderEvent: hideKeyboard)
            }
            VStack(spacing: 15) {
                ColorChannelTextField(value: $red)
                    .focused($focusedField, equals: .red)
                ColorChannelTextField(value: $green)
                    .focused($focusedField, equals: .green)
                ColorChannelTextField(value: $blue)
                    .focused($focusedField, equals: .blue)
            }
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    keyboardToolbar
                }
            }
        }
    }

    private var keyboardToolbar: some View {
        HStack {
            Button(action: prevBarButtonPressed) {
                Label("Prev", systemImage: "chevron.up")
            }
            Button(action: nextBarButtonPressed) {
                Label("Next", systemImage: "chevron.down")
            }
            Spacer()
            Button("Done", action: hideKeyboard)
        }
    }

    private func nextBarButtonPressed() {
        switch focusedField {
        case .red: focusedField = .green
        case .green: focusedField = .blue
        default: hideKeyboard()
        }
    }

    private func prevBarButtonPressed() {
        switch focusedField {
        case .blue: focusedField = .green
        case .green: focusedField = .red
        default: break
        }
    }

    private func hideKeyboard() {
        focusedField = nil
    }
}

struct ColorChannelSlider: View {
    @Binding var value: Double

    let color: Color
    let tapOnSliderEvent: () -> Void

    var body: some View {
        HStack {
            Text("0")
                .foregroundColor(.white)
            Slider(value: $value, in: 0...255, step: 1, onEditingChanged: sliderIsTapped)
                .tint(color)

            Text("255")
                .foregroundColor(.white)
        }
    }
    
    private func sliderIsTapped(editingChanged: Bool) {
        if editingChanged {
            tapOnSliderEvent()
        }
    }
}

struct ColorChannelTextField: View {
    @Binding var value: Double

    var body: some View {
        TextField("", value: $value, formatter: NumberFormatter(), onEditingChanged: checkValue)
            .cornerRadius(10)
            .multilineTextAlignment(.center)
            .frame(width: 65)
            .padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 0))
            .overlay(Capsule().stroke(lineWidth: 2))
            .foregroundColor(.white)
            .keyboardType(.decimalPad)
    }
    
    private func checkValue(editingChanged: Bool) {
        if !editingChanged {
            if value > 255 {
                value = 255
            } else if value < 0 {
                value = 0
            }
        }
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
                ColorChannelSlider(value: .constant(60), color: .cyan, tapOnSliderEvent: {})
                ColorChannelTextField(value: .constant(60))
            }
        }
    }
}
