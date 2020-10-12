//
//  WeatherViewModel.swift
//  10Words
//
//  Created by admin on 30.09.2020.
//  Copyright © 2020 Natali. All rights reserved.
//

import Foundation

struct WeatherViewModel {
  
//  let cityName: String
  let temperature: String
  let hourly: [Current]
  let description: String?
  
  init(weather: WeatherModel) {
//    self.cityName = weather.name
    self.temperature = String(format: "%.1f", weather.current.temp)
    self.description = weather.current.weather[0].weatherDescription
    self.hourly = weather.hourly
  }
}


