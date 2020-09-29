//
//  ViewModel.swift
//  10Words
//
//  Created by admin on 29.09.2020.
//  Copyright © 2020 Natali. All rights reserved.
//

import Foundation

final class ListWordsViewModel {
  
  let title: String
  let wordServise: WordServise
  
  init() {
    self.wordServise =  WordServise()
    self.title = ""
  }
}
