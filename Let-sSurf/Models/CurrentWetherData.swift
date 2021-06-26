//
//  CurrentWetherData.swift
//  NowWeather
//
//  Created by Татьяна Татьяна on 23.06.2021.
//


import Foundation

// MARK: - WeatherMarin
struct WeatherMarin: Codable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let weather: [Weather]
}


// MARK: - Weather
struct Weather: Codable {
    let hourly: [Hourly]
}


// MARK: - Hourly
struct Hourly: Codable {
    let feelsLikeC, sigHeightM, swellHeightM, time: String
    let waterTempC: String
    let langRu: [LangRu]?
    
    enum CodingKeys: String, CodingKey {
        case langRu = "lang_ru"
        case sigHeightM = "sigHeight_m"
        case swellHeightM = "swellHeight_m"
        case feelsLikeC = "FeelsLikeC"
        case waterTempC = "waterTemp_C"
        case time
    }
}

struct LangRu: Codable {
    let value: String?
}

