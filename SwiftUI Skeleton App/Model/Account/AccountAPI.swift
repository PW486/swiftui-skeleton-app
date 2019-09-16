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

  func signin(_ parameters: Parameters?, completion: @escaping (Result<Any>) -> Void) {
    RequestAPI.shared.call("v1/signin", method: .post, parameters: parameters) { res in
      switch res {
      case .success:
        if let json = res.value as? JSON {
          print(json)
          UserDefaults.standard.set(json["access_token"].string, forKey: "access_token")
          completion(.success(json))
        }
      case let .failure(error):
        completion(.failure(error))
      }
    }
  }

  func signup(_ parameters: Parameters?, completion: @escaping (Result<Any>) -> Void) {
    RequestAPI.shared.call("v1/signup", method: .post, parameters: parameters) { res in
      switch res {
      case .success:
        if let json = res.value as? JSON {
          print(json)
          UserDefaults.standard.set(json["access_token"].string, forKey: "access_token")
          completion(.success(json))
        }
      case let .failure(error):
        completion(.failure(error))
      }
    }
  }
}
