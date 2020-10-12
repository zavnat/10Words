//
//  Service.swift
//  10Words
//
//  Created by admin on 08.10.2020.
//  Copyright © 2020 Natali. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

final class Service {
  
  private enum Error: Swift.Error {
    case invalidResponse(URLResponse)
    case invalidJSON(Swift.Error)
  }
  
  private enum Cities {
    case Moscow
    case StPeterburg
  }
  
  func fetchWeather() -> Observable<[WeatherModel]> {
    let req1 = fetch(city: .Moscow)
    let req2 = fetch(city: .StPeterburg)
    
    let allRsult = Observable.zip(req1, req2) { r1, r2 in
       return [r1, r2]
    }
    return allRsult
  }
  
  
  private func getCoord(_ coord: Cities) -> (lat: Double, lon: Double){
    switch coord {
    case .Moscow:
      return (lat: 55.75, lon: 37.62)
    case .StPeterburg:
      return (lat: 59.89, lon: 30.26)
    }
  }
  
  
  private func fetch(city: Cities) -> Observable<WeatherModel> {
    print("network")
    let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=\(getCoord(city).lat)&lon=\(getCoord(city).lon)&appid=6f10f6e15cea962a84d8335452a6bee0&lang=ru&units=metric&exclude=minutely")!
    
    let request = URLRequest(url: url)
    
    return URLSession.shared.rx.response(request: request)
      .map { result -> Data in
        guard result.response.statusCode == 200 else {
          throw Error.invalidResponse(result.response)
        }
        return result.data
    }.map { data  in
      do {
        let weatherItem = try JSONDecoder().decode(
          WeatherModel.self, from: data
        )
        return weatherItem
      } catch let error {
        throw Error.invalidJSON(error)
      }
    }.asObservable()
  }
  
  
}
