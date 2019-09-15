//
//  AccountAPI.swift
//  SwiftUI Skeleton App
//
//  Created by PW486 on 2019/09/15.
//  Copyright © 2019 PW486. All rights reserved.
//

import Alamofire
import SwiftUI
import SwiftyJSON

struct AccountAPI {
  static let shared = AccountAPI()

  func signin(_ parameters: Parameters, completionHandler: @escaping (Result<[String: Any]>) -> Void) {
    performRequest("v1/signin", method: .post, parameters: parameters, completion: completionHandler)
  }

  func signup(_ parameters: Parameters, completionHandler: @escaping (Result<[String: Any]>) -> Void) {
    performRequest("v1/signup", method: .post, parameters: parameters, completion: completionHandler)
  }
}
