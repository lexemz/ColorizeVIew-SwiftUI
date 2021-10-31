//
//  ColorizedView.swift
//  ColorizedView
//
//  Created by Igor on 31.10.2021.
//

import SwiftUI

struct ColorizedView: View {
    var red: Double
    var green: Double
    var blue: Double

    var body: some View {

        RoundedRectangle(cornerRadius: 40)
            .frame(height: 150)
            .foregroundColor(
                Color(
                    red: red / 255,
                    green: green / 255,
                    blue: blue / 255
                )
            )
            .overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(lineWidth: 5)
                    .foregroundColor(.white)
            )
            
    }
}

struct ColorizedView_Previews: PreviewProvider {
    static var previews: some View {
        ColorizedView(red: 111, green: 111, blue: 111)
    }
}
