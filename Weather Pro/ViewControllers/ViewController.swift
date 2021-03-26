//
//  ViewController.swift
//  Networking_9_CurrentWeather
//
//  Created by ThePsih13 on 10.01.2021.
//  Copyright © 2021 Vlad Lytvynets. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var minTemp: UILabel!
    @IBOutlet weak var maxTemp: UILabel!
    
    let decoder = JSONDecoder()
    var namesCity: String!
    var managet = NetworkWeaterManager()
    
    @IBAction func button(_ sender: UIButton) {
        namesCity = textField.text
        managet.getRequest(withCity: namesCity){currentWeather in
            self.updateinter(currentWeather: currentWeather)
        }
    }
    
    func updateinter(currentWeather: CurrentWeather){
        DispatchQueue.main.async {
            self.label.text = currentWeather.cityName
            self.tempLabel.text = currentWeather.tempString + " °C" 
            self.weatherImage.image = UIImage(systemName: currentWeather.iconNameString)
            self.minTemp.text = currentWeather.tempMinString
            self.maxTemp.text = currentWeather.tempMaxString
        }
    }
}

