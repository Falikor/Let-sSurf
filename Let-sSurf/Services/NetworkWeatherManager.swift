//
//  NetworkWeatherManager.swift
//  NowWeather
//
//  Created by Татьяна Татьяна on 20.06.2021.
//

import Foundation
import UIKit

class NetworkWeatherManager {
    
    var onCompletion: ((CurrentWeatherMarin) -> Void)?
    
    func fethCurrentWeather(weather: String) {
        let urlString = "https://api.worldweatheronline.com/premium/v1/marine.ashx?key=\(apiKey)&q=\(weather)&format=json&includelocation=no&lang=ru"
        guard let url = URL(string: urlString) else {return}
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) {data, response, error in
            if let data = data {
                if let weatherMarin = self.parseJSON(withData: data) {
                    self.onCompletion?(weatherMarin)
                }
            }
        }
        task.resume()
    }
    func parseJSON(withData data: Data) -> CurrentWeatherMarin?  {
        let decoder = JSONDecoder()
        do {
            let weatherMarinData = try decoder.decode(WeatherMarin.self, from: data)
            print(weatherMarinData)
            guard let weatherMarin = CurrentWeatherMarin(weatherMarinData: weatherMarinData) else {return nil}
            return weatherMarin
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
    
        
}
