//
//  WeatherLabel.swift
//  WeatherDataView
//
//  Created by Matheus Quirino Cardoso on 26/10/23.
//

import SwiftUI

struct WeatherLabel: View {
    
    let text: String
    let fontSize: CGFloat
    let bold: Bool
    
    init(text: String, fontSize: CGFloat, bold: Bool = false) {
        self.text = text
        self.fontSize = fontSize
        self.bold = bold
    }
    
    var body: some View {
        Text(text)
            .font(.system(size: fontSize,
                          weight: bold ? .bold : .medium))
            .foregroundStyle(.white, .orange)
    }
}
