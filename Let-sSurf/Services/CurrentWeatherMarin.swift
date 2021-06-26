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
    let langRu: String
    let tameNow: String
    // через 3 часа
    let waveHeightSecond: String
    let waterFelsLikeCSecond: String
    let waterTemperatureSecond: String
    let langRuSecond: String
    let tameSecond: String
    
    
    init?(weatherMarinData: WeatherMarin) {
        waveHeight = weatherMarinData.data.weather.first!.hourly.first!.sigHeightM
        waterFelsLikeC = weatherMarinData.data.weather.first!.hourly.first!.feelsLikeC
        waterTemperature = weatherMarinData.data.weather.first!.hourly.first!.waterTempC
        
        guard let lang = weatherMarinData.data.weather.first!.hourly.first!.langRu?.first?.value else {return nil}
        langRu = lang
        tameNow = weatherMarinData.data.weather.first!.hourly.first!.time
        
        // через 3 часа
        waveHeightSecond = weatherMarinData.data.weather[2].hourly[2].sigHeightM
        waterFelsLikeCSecond = weatherMarinData.data.weather[2].hourly[2].feelsLikeC
        waterTemperatureSecond = weatherMarinData.data.weather[2].hourly[2].waterTempC
        
        guard let langSecond = weatherMarinData.data.weather[2].hourly[2].langRu?.first!.value else {return nil}
        langRuSecond = langSecond
        tameSecond = weatherMarinData.data.weather[2].hourly[2].time
        
    }
}
