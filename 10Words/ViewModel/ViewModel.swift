//
//  ViewModel.swift
//  10Words
//
//  Created by admin on 29.09.2020.
//  Copyright © 2020 Natali. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class ViewModel {
  
  let service: Service
  let disposeBag = DisposeBag()
  
  var weatherItems: BehaviorRelay<[WeatherModel]> = BehaviorRelay(value: [])
  let showLoading: BehaviorRelay<Bool> = BehaviorRelay(value: false)
  let showError: BehaviorRelay<Bool> = BehaviorRelay(value: false)
  
  init() {
    self.service = Service()
  }
  
  func getWeather() {
    showLoading.accept(true)
    print("start")
    service.fetchWeather()
//      .share()
      .observeOn(MainScheduler.instance)
      .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
      .subscribe(onNext: { weather in
        
        self.showLoading.accept(false)
        print("end")
               
        self.weatherItems.accept(weather)
        
       
      }).disposed(by: disposeBag)
  }
  
  
  
  
  //  func fetchWeatherViewModel(city: String) -> Observable <[WeatherViewModel]> {
  //    weatherServise.fetchWeather(cityName: city).map { $0.map { WeatherViewModel(weather: $0) } }
  //  }
  //
  //
  //  func fetchWeatherViewModel2() -> Observable <[WeatherViewModel]> {
  //    weatherServise.getDefaultWeather().map { $0.map { WeatherViewModel(weather: $0) } }
  //  }
}
