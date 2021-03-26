//
//  CurrentWeatherData.swift
//  Networking_9_CurrentWeather
//
//  Created by ThePsih13 on 12.01.2021.
//  Copyright © 2021 Vlad Lytvynets. All rights reserved.
//

import Foundation

struct CurrentWeather {
    let cityName: String
    let temp: Int
    let tempMin: Int
    let tempMax: Int
    
    var tempMinString: String{
        return ("\(tempMin)")
    }
    
    var tempMaxString: String{
         return ("\(tempMax)")
     }
    
    var tempString: String{
        return("\(temp)")
    }
    
    let conditionCode: Int
    var iconNameString: String {
        switch conditionCode {
        case 200...232: return "cloud.bolt.rain.fill"
        case 300...321: return "cloud.drizzle.fill"
        case 500...531: return "cloud.rain.fill"
        case 600...622: return "cloud.snow.fill"
        case 701...781: return "smoke.fill"
        case 800: return "sun.min.fill"
        case 801...804: return "cloud.fill"
        default:
            return "nosign"
        }
    }
    
    init?(WeatherData: Weather){
        cityName = WeatherData.name
        temp = Int(WeatherData.main.temp)
        conditionCode = WeatherData.weather.first!.id
        tempMin = Int(WeatherData.main.tempMin)
        tempMax = Int(WeatherData.main.tempMax)
    }
}
