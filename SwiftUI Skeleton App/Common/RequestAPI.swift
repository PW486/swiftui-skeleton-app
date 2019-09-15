//
//  RequestAPI.swift
//  SwiftUI Skeleton App
//
//  Created by PW486 on 2019/09/15.
//  Copyright © 2019 PW486. All rights reserved.
//

import Alamofire
import SwiftUI
import SwiftyJSON

struct RequestAPI {
  static let shared = RequestAPI()

  func call(_ section: String, method: HTTPMethod, parameters: Parameters?, completion: @escaping (Result<Any>) -> Void) {
    let baseURL = URL(string: "http://localhost:3000/api")
    let url = baseURL!.appendingPathComponent(section)
    let accessToken = UserDefaults.standard.string(forKey: "access_token") ?? ""
    let headers: HTTPHeaders = ["Authorization": "Bearer \(accessToken)"]

    print(accessToken)

    Alamofire.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { res in
      switch res.result {
      case .success:
//        print(res.result.value)
        // swiftlint:disable:next force_cast
        let value = res.result.value
        completion(.success(value))
        let json = JSON(res.result.value!)
//        print(json)
      case let .failure(error):
        print(error.localizedDescription)
        completion(.failure(error))
      }
    }
  }
}
