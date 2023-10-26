//
//  WeatherSymbol.swift
//  WeatherDataView
//
//  Created by Matheus Quirino Cardoso on 26/10/23.
//

import SwiftUI

struct WeatherSymbol: View {
    
    let systemName: String
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        Image(systemName: systemName)
            .symbolRenderingMode(.multicolor)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: width, height: height)
    }
}
