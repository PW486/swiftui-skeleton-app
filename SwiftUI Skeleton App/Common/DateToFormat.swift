//
//  DateToFormat.swift
//  SwiftUI Skeleton App
//
//  Created by PW486 on 2019/09/16.
//  Copyright © 2019 PW486. All rights reserved.
//

import Foundation

func DateToFormat(_ value: String) -> String {
  let dateFormatter = DateFormatter()
  dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"

  let resultFormatter = DateFormatter()
  resultFormatter.dateFormat = "MMM dd, yyyy"

  if let date = dateFormatter.date(from: value) {
    return resultFormatter.string(from: date)
  } else {
    return value
  }
}
