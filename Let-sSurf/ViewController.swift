//
//  ViewController.swift
//  NowWeather
//
//  Created by Татьяна Татьяна on 20.06.2021.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate, UIPickerViewDataSource, UIPickerViewDelegate {

    

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var temoeratureWater: UILabel!
    @IBOutlet weak var temperatureWaterFelsLike: UILabel!
    @IBOutlet weak var waveHeight: UILabel!
    @IBOutlet weak var pickerViewSpotPlace: UIPickerView!
    
    
    
    
    private var networkWeatherManager = NetworkWeatherManager()
    private var spodPlace = SpotRu()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkWeatherManager.onCompletion = { [weak self] weatherMarin in
            guard let self = self else {return}
            self.updateInterfaceWith(weather: weatherMarin)
        }
        searchBar.delegate = self
        pickerViewSpotPlace.dataSource = self
        pickerViewSpotPlace.delegate = self

        // Do any additional setup after loading the view.
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        networkWeatherManager.fethCurrentWeather(weather: searchBar.text!)
        
    }
    
}

extension ViewController {
    private func updateInterfaceWith(weather: CurrentWeatherMarin) {
        DispatchQueue.main.async {
            self.waveHeight.text = "Волна высотой: \(weather.waveHeight) м."
            self.temperatureWaterFelsLike.text = "Температура воды: \(weather.waterFelsLikeC) \u{2103}"
            self.temoeratureWater.text = "Ощущаемая температура: \(weather.waterTemperature) \u{2103}"
        }
    }
}

extension ViewController {
    internal func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }
    
    internal func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return spodPlace.spotTerritory.count
    }
}

extension ViewController {
    internal func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return spodPlace.spotTerritory[row].name
    }
}
