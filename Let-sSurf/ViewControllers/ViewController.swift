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
    @IBOutlet weak var infoWeather: UILabel!
    
    @IBOutlet weak var imagWeather: UIImageView!
    
    
    
    private var networkWeatherManager = NetworkWeatherManager()
    private var spodPlace = SpotRu()
    private var selectSpot: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkWeatherManager.onCompletion = { weatherMarin in
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
    
    @IBAction func faindWeatherSpot(_ sender: Any) {
        networkWeatherManager.fethCurrentWeather(weather: selectSpot)

    }
}

extension ViewController {
    private func updateInterfaceWith(weather: CurrentWeatherMarin) {
        DispatchQueue.main.async {
            self.waveHeight.text = "Волна высотой: \(weather.waveHeight) м. (\(weather.waveHeightSecond))"
            self.temperatureWaterFelsLike.text = "Температура воды: \(weather.waterFelsLikeC) \u{2103} (\(weather.waterFelsLikeCSecond))"
            self.temoeratureWater.text = "Ощущаемая температура: \(weather.waterTemperature) \u{2103} (\(weather.waterTemperatureSecond))"
            self.infoWeather.text = "\(weather.langRu) (\(weather.langRuSecond))"
        }
        selectSpot = ""
    }
}

extension ViewController {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return spodPlace.spotTerritory.count
        case 1:
            return spodPlace.spotPlaceTerritori.count
        default:
            return 0
        }
    }
}

extension ViewController {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        if component == 0 {
            let territory = spodPlace.spotTerritory[row]
            return territory.name
        } else {
            let spot = spodPlace.spotPlaceTerritori[row]
            return spot.name
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            let territory = spodPlace.spotTerritory[row]
            spodPlace.spotPlaceTerritori = spodPlace.getSpot(nameTerritoryId: territory.id)
            print(spodPlace.spotPlaceTerritori[row])
            pickerView.reloadComponent(1)
           // pickerView.selectRow(0, inComponent: 1, animated: true)
            
        }
        print(spodPlace.spotPlaceTerritori[row])
        selectSpot = spodPlace.spotPlaceTerritori[row].coordinates
    }
}

