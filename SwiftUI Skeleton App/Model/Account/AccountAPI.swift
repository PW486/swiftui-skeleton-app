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

  func signin(_ parameters: Parameters?, completionHandler: @escaping (Result<Any>) -> Void) {
    RequestAPI.shared.call("v1/signin", method: .post, parameters: parameters) { res in
      print(res.value!)

      switch res {
      case .success:
        let json = JSON(res.value!)
        print(json)
        print(json["access_token"].string)
        UserDefaults.standard.set(json["access_token"].string, forKey: "access_token")
        // swiftlint:disable:next force_cast
        let value = res.value! as! [String: Any]
        completionHandler(.success(value))
      case let .failure(error):
        print(error.localizedDescription)
        completionHandler(.failure(error))
      }
    }
  }

  func signup(_ parameters: Parameters?, completionHandler: @escaping (Result<Any>) -> Void) {
    RequestAPI.shared.call("v1/signup", method: .post, parameters: parameters, completion: completionHandler)
  }
}
