//
//  ViewController.swift
//  10Words
//
//  Created by admin on 29.09.2020.
//  Copyright © 2020 Natali. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
  
  let disposeBag = DisposeBag()
  let activityIndicator = UIActivityIndicatorView(style: .large)
  private var viewModel = ViewModel()
  @IBOutlet weak var temperatureLabel: UILabel!
  @IBOutlet weak var searchTextField: UISearchBar!
  @IBOutlet weak var errorLabel: UILabel!
  
  
  static func instantiate() -> ViewController {
    let storyboard = UIStoryboard(name: "Main", bundle: .main)
    let viewController = storyboard.instantiateInitialViewController() as! ViewController
    return viewController
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    navigationController?.setNavigationBarHidden(true, animated: false)
    searchTextField.delegate = self
    
    activityIndicator.center =  CGPoint(x: view.bounds.size.width/2, y: view.bounds.size.height/2)
    view.addSubview(activityIndicator)
    
    setupBindConfiguration()
    viewModel.getWeather()
  }
   
  
  func setupBindConfiguration(){
    
    viewModel.weatherItems
      .asObservable()
      .subscribe(onNext: { weather in
        for i in 0..<weather.count {
          self.temperatureLabel.text = String(weather[0].current.temp)
          print(weather[i].current.feelsLike)
        }
      }).disposed(by: disposeBag)
    
    viewModel.showLoading
      .asObservable()
      .bind (to: activityIndicator.rx.isAnimating)
      .disposed(by: disposeBag)
    
    viewModel.showError
      .asObservable()
      .bind(to: errorLabel.rx.isHidden)
      .disposed(by: disposeBag)
  }
  
}

extension ViewController: UISearchBarDelegate {
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    guard let cityText = searchBar.text else {return}
    
  }
}

