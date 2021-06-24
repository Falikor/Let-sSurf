//
//  ModelSpot.swift
//  NowWeather
//
//  Created by Татьяна Татьяна on 24.06.2021.
//


import Foundation

struct SpotTerritory{
    var id: Int
    var name: String
}

struct SpotPlace{
    var name: String
    var coordinates: String
    var nameTerritory_id : Int
}

class SpotRu {
    var spotTerritory = [SpotTerritory]()
    var spotPlace = [SpotPlace]()
    init() {
        setupData()
    }
    func setupData() {
        spotTerritory = [
            SpotTerritory(id: 1, name: "Черное море"),
            SpotTerritory(id: 2, name: "Крым"),
            SpotTerritory(id: 3, name: "Азовское море"),
            SpotTerritory(id: 4, name: "Балтийское море"),
            SpotTerritory(id: 5, name: "Японское море"),
            SpotTerritory(id: 6, name: "Тихий океан")
        ]
        spotPlace = [
            SpotPlace(name: "Пляж Аше", coordinates: "43.959179,39.258153", nameTerritory_id: 1),
            SpotPlace(name: "Имеретинская бухта", coordinates: "43.397014,39.957052", nameTerritory_id: 1),
            SpotPlace(name: "Beach Bridge Resort", coordinates: "43.381316,40.000930", nameTerritory_id: 1),
            SpotPlace(name: "Sochifornia", coordinates: "43.572583,39.725105", nameTerritory_id: 1),
            SpotPlace(name: "Мамайка", coordinates: "43.628925,39.691541", nameTerritory_id: 1),
            
            SpotPlace(name: "Новый Свет", coordinates: "44.827331,34.917872", nameTerritory_id: 2),
            SpotPlace(name: "Веселовская Бухта", coordinates: "44.821212,34.866120", nameTerritory_id: 2),
            SpotPlace(name: "Пляж Учкуевка", coordinates: "44.640985,33.530431", nameTerritory_id: 2),
            SpotPlace(name: "Любимовка", coordinates: "44.673254,33.545290", nameTerritory_id: 2),
            SpotPlace(name: "Приморский", coordinates: "45.110826,35.481976", nameTerritory_id: 2),
            SpotPlace(name: "Мыс Казантип", coordinates: "45.462258,35.821448", nameTerritory_id: 2),
            SpotPlace(name: "Царский пляж", coordinates: "44.820678,34.905355", nameTerritory_id: 2),
            SpotPlace(name: "Мыс Тархантут", coordinates: "45.346801,32.493527", nameTerritory_id: 2),
            SpotPlace(name: "Мыс Фиолент", coordinates: "44.497513,33.488796", nameTerritory_id: 2),
            SpotPlace(name: "Гурзуф, Оленевка", coordinates: "44.502977,33.506678", nameTerritory_id: 2),
            
            SpotPlace(name: "Должанская коса", coordinates: "46.656579,37.752817", nameTerritory_id: 3),
            SpotPlace(name: "Павло-Очаковская коса", coordinates: "47.042324,39.106184", nameTerritory_id: 3),
            SpotPlace(name: "Голубицкая станица", coordinates: "45.332526,37.278154", nameTerritory_id: 3),
            
            SpotPlace(name: "Мыс Флотский", coordinates: "60.161881,29.153929", nameTerritory_id: 4),
            SpotPlace(name: "Зеленоградск", coordinates: "54.967272,20.478191", nameTerritory_id: 4),
            SpotPlace(name: "Мыс Гвардейский", coordinates: "54.963196,20.270214", nameTerritory_id: 4),
            SpotPlace(name: "Пионерский", coordinates: "54.955889,20.228649", nameTerritory_id: 4),
            SpotPlace(name: "Светлогорск", coordinates: "54.946557,20.130355", nameTerritory_id: 4),
            SpotPlace(name: "Янтарный", coordinates: "54.870644,19.930464", nameTerritory_id: 4),
            SpotPlace(name: "Солнечное", coordinates: "60.145504,29.917167", nameTerritory_id: 4),
            SpotPlace(name: "Бухта Желтая", coordinates: "60.269219,28.916752", nameTerritory_id: 4),
            SpotPlace(name: "Заостровье", coordinates: "54.958925,20.245132", nameTerritory_id: 4),
            
            SpotPlace(name: "Рейнеке", coordinates: "42.911441,131.714944", nameTerritory_id: 5),
            SpotPlace(name: "Находка", coordinates: "42.813007,132.791997", nameTerritory_id: 5),
            SpotPlace(name: "Мыс Ахлестышева", coordinates: "42.999372,131.931883", nameTerritory_id: 5),
            SpotPlace(name: "Коса Назимова", coordinates: "42.618317,130.788330", nameTerritory_id: 5),
            SpotPlace(name: "Тавричанка", coordinates: "43.314187,131.869242", nameTerritory_id: 5),
            SpotPlace(name: "Бухта Лазурная", coordinates: "43.191237,132.114803", nameTerritory_id: 5),
            SpotPlace(name: "Кунгасный парк", coordinates: "43.135400,131.885136", nameTerritory_id: 5),
            SpotPlace(name: "Бухта Патрокл", coordinates: "43.064056,131.942632", nameTerritory_id: 5),
            SpotPlace(name: "Бухта Емар", coordinates: "43.206209,132.162138", nameTerritory_id: 5),
            SpotPlace(name: "Щитовая", coordinates: "43.114814,132.026721", nameTerritory_id: 5),
            
            SpotPlace(name: "Териберка", coordinates: "69.180672,35.126698", nameTerritory_id: 6),
            SpotPlace(name: "Полуостров Рыбачий", coordinates: "69.803140,32.840816", nameTerritory_id: 6),
            SpotPlace(name: "Залив Касатка", coordinates: "44.943995,147.659452", nameTerritory_id: 6),
            SpotPlace(name: "Халактырский пляж", coordinates: "53.111194,159.108777", nameTerritory_id: 6),
            SpotPlace(name: "Яблочное", coordinates: "47.164508,142.042085", nameTerritory_id: 6),
            SpotPlace(name: "Вилючинская Сопка", coordinates: "52.638908,158.421128", nameTerritory_id: 6),
        ]
    }
   // func getSpot(nameTerritory_id: Int) -> [SpotPlace] {
        
   // }
}
