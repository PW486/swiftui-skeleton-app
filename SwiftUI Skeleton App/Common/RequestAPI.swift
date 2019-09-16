//
//  RequestAPI.swift
//  SwiftUI Skeleton App
//
//  Created by PW486 on 2019/09/15.
//  Copyright © 2019 PW486. All rights reserved.
//

import Alamofire
import Foundation
import SwiftyJSON

struct RequestAPI {
  static func call(_ path: String, method: HTTPMethod, parameters: Parameters?, completion: @escaping (Result<JSON>) -> Void) {
    let baseURL = URL(string: "http://localhost:3000/api")
    let url = baseURL!.appendingPathComponent(path)
    let accessToken = UserDefaults.standard.string(forKey: "access_token") ?? ""
    let headers: HTTPHeaders = ["Authorization": "Bearer \(accessToken)"]

    Alamofire.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { res in
      switch res.result {
      case .success:
        if let value = res.result.value {
          let json = JSON(value)
          completion(.success(json))
        }
      case let .failure(error):
        print(error.localizedDescription)
        completion(.failure(error))
      }
    }
  }
}
