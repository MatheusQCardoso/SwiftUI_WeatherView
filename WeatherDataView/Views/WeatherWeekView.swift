//
//  WeatherWeekView.swift
//  WeatherDataView
//
//  Created by Matheus Quirino Cardoso on 26/10/23.
//

import SwiftUI

struct WeatherWeekViewModel: Hashable {
    let topTitle: String
    let symbolName: String
    let temperatureCelsius: Int
}

struct WeatherWeekView: View {
    let kHorizontalSpacing: CGFloat = 8
    let kVerticalSpacing: CGFloat = 12
    let kTopLabelFontSize: CGFloat = 24
    let kSymbolFrameSize: CGFloat = 42
    let kBottomLabelFontSize: CGFloat = 24
    let kDividerHeight: CGFloat = 120
    let kDividerPadding: CGFloat = 4
    
    let viewModels: [WeatherWeekViewModel]
    
    var body: some View {
        HStack(spacing: kHorizontalSpacing) {
            ForEach(viewModels, id: \.self) { viewModel in
                
                VStack(spacing: kVerticalSpacing) {
                    WeatherLabel(text: viewModel.topTitle,
                                 fontSize: kTopLabelFontSize)
                    
                    WeatherSymbol(systemName: viewModel.symbolName,
                                  width: kSymbolFrameSize,
                                  height: kSymbolFrameSize)
                    
                    WeatherLabel(text: "\(viewModel.temperatureCelsius)°",
                                 fontSize: kBottomLabelFontSize)
                    
                }
                
                if viewModel.hashValue != viewModels.last?.hashValue {
                    Divider()
                        .frame(height: kDividerHeight)
                        .background(Color.white)
                        .padding(kDividerPadding)
                }
            }
        }
    }
}
