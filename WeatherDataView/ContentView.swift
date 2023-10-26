//
//  ContentView.swift
//  WeatherDataView
//
//  Created by Matheus Quirino Cardoso on 26/10/23.
//

import SwiftUI

struct ContentView: View {
    let kInBetweenSpacing: CGFloat = 48
    let kButtonFontSize: CGFloat = 28
    let kButtonTitlePadding: CGFloat = 20
    let kButtonCornerRadius: CGFloat = 15
    
    @State var isNight: Bool = false
    
    //MARK: MOCK -
    let weekModels: [WeatherWeekViewModel] = [
        .init(topTitle: "TUE",
              symbolName: "cloud.sun.rain.fill",
              temperatureCelsius: 13),
        .init(topTitle: "WED",
              symbolName: "cloud.bolt.fill",
              temperatureCelsius: 8),
        .init(topTitle: "THU",
              symbolName: "wind",
              temperatureCelsius: 5),
        .init(topTitle: "FRI",
              symbolName: "cloud.bolt.rain.fill",
              temperatureCelsius: 3),
        .init(topTitle: "SAT",
              symbolName: "snow",
              temperatureCelsius: 2)
    ]
    
    var body: some View {
        ZStack {
            BackgroundGradient(isNight: isNight)
            
            VStack(spacing: kInBetweenSpacing) {
                WeatherStatusView(cityDescriptor: "Falconara Marittima, AN",
                                  iconName: isNight ? "cloud.moon.fill" : "cloud.sun.fill",
                                  temperatureCelsius: 21,
                                  windSpeedKmH: 5,
                                  windDirection: "SE")
                
                WeatherWeekView(viewModels: weekModels)
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherLabel(text: "Change Day Time",
                                 fontSize: kButtonFontSize, bold: true)
                    .padding(kButtonTitlePadding)
                    .background {
                        RoundedRectangle(cornerRadius: kButtonCornerRadius,
                                         style: .continuous)
                        .fill(
                            isNight ?
                                Color.cyan.gradient :
                                Color.orange.gradient
                        )
                    }
                }
                
                Spacer()
            }
        }
    }
}

//MARK: - Layout Components -
struct BackgroundGradient: View {
    static let dayTimeColors: [Color] = [.blue, .cyan]
    static let nightTimeColors: [Color] = [.black, .gray]
    
    let isNight: Bool
    
    var body: some View {
        LinearGradient(colors: isNight ? Self.nightTimeColors : Self.dayTimeColors,
                       startPoint: .topLeading,
                       endPoint: .bottom)
        .ignoresSafeArea()
    }
}

struct WeatherStatusView: View {
    let kInBetweenSpacing: CGFloat = 20
    let kTopLabelFontSize: CGFloat = 32
    let kTopPadding: CGFloat = 64
    let kImageFrameSize: CGFloat = 160
    let kMainLabelFontSize: CGFloat = 72
    let kWindLabelFontSize: CGFloat = 24
    
    let cityDescriptor: String
    let iconName: String
    let temperatureCelsius: Int
    let windSpeedKmH: Int
    let windDirection: String
    
    var body: some View {
        VStack(spacing: kInBetweenSpacing) {
            WeatherLabel(text: cityDescriptor,
                         fontSize: kTopLabelFontSize)
            .padding(.top, kTopPadding)
            
            WeatherSymbol(systemName: iconName,
                          width: kImageFrameSize,
                          height: kImageFrameSize)
            
            WeatherLabel(text: "\(temperatureCelsius)°C",
                         fontSize: kMainLabelFontSize, bold: true)
            
            WeatherLabel(text: "Wind: \(windSpeedKmH) Km/h | Direction: \(windDirection)",
                         fontSize: kWindLabelFontSize)
        }
    }
}

//MARK: - PREVIEW SETUP -
#Preview {
    ContentView()
}
