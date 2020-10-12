//
//  AppCoordinator.swift
//  10Words
//
//  Created by admin on 30.09.2020.
//  Copyright © 2020 Natali. All rights reserved.
//

import UIKit


class AppCoordinator: Coordinator {
  
  private let window: UIWindow
  
  init(window: UIWindow) {
    self.window = window
  }
  
  func start() {
    let viewController = ViewController.instantiate()
    let navigationController = UINavigationController(rootViewController: viewController)
    window.rootViewController = navigationController
    window.makeKeyAndVisible()
  }
}
