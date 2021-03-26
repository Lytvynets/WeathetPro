//
//  NetworkManager.swift
//  Networking_9_CurrentWeather
//
//  Created by ThePsih13 on 11.01.2021.
//  Copyright © 2021 Vlad Lytvynets. All rights reserved.
//

import Foundation

class NetworkWeaterManager {
    
    func getRequest(withCity city: String,complitionHandler:@escaping (CurrentWeather) -> Void){
        let url = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&apikey=\(apiKey)&units=metric"
        guard let urlString = URL(string: url) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: urlString) { (data, response, error) in
            if let data = data{
                if let currentWeather = self.parseJson(withData: data){
                    complitionHandler(currentWeather)
                }
            }
        }
        task.resume()
    }
    
    
    func parseJson(withData data: Data) -> CurrentWeather?{
        let decoder = JSONDecoder()
        do {
            let currentWeatherData = try decoder.decode(Weather.self, from: data)
            guard let currentWeather = CurrentWeather(WeatherData: currentWeatherData) else { return nil }
            return currentWeather
        } catch {
            print(error)
        }
        return nil
    }
    
}
