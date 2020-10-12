//
//  WeatherModel.swift
//  10Words
//
//  Created by admin on 30.09.2020.
//  Copyright © 2020 Natali. All rights reserved.
//

import Foundation


struct Weather: Codable {
    let coord: Coord
//    let weather: [WeatherObj]
//    let base: String
//    let main: Main
//    let visibility: Int
//    let wind: Wind
//    let sys: Sys
//    let timezone, id: Int
//    let name: String
//    let cod: Int
}


struct Coord: Codable {
    let lon, lat: Double
}


//struct Main: Codable {
//    let temp, feelsLike, tempMin, tempMax: Double
//    let pressure, humidity: Int
//
//    enum CodingKeys: String, CodingKey {
//        case temp
//        case feelsLike = "feels_like"
//        case tempMin = "temp_min"
//        case tempMax = "temp_max"
//        case pressure, humidity
//    }
//}
//
//
//struct Sys: Codable {
//    let type, id: Int
//    let country: String
//    let sunrise, sunset: Int
//}
//
//
//struct WeatherObj: Codable {
//    let id: Int
//    let main, weatherDescription, icon: String
//
//    enum CodingKeys: String, CodingKey {
//        case id, main
//        case weatherDescription = "description"
//        case icon
//    }
//}
//
//
//struct Wind: Codable {
//    let speed, deg: Double
//}
