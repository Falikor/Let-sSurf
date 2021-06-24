//
//  CurrentWeatherMarin.swift
//  NowWeather
//
//  Created by Татьяна Татьяна on 23.06.2021.
//

import Foundation

struct CurrentWeatherMarin {
    let waveHeight: String
    let waterFelsLikeC: String
    let waterTemperature: String
    
    
    init?(weatherMarinData: WeatherMarin) {
        waveHeight = weatherMarinData.data.weather.first!.hourly.first!.sigHeightM
        waterFelsLikeC = weatherMarinData.data.weather.first!.hourly.first!.feelsLikeC
        waterTemperature = weatherMarinData.data.weather.first!.hourly.first!.waterTempC
    }
}
