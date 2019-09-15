//
//  BoardAPI.swift
//  SwiftUI Skeleton App
//
//  Created by PW486 on 2019/09/15.
//  Copyright © 2019 PW486. All rights reserved.
//

import Alamofire
import SwiftUI
import SwiftyJSON

struct PostAPI {
  static let shared = PostAPI()

  func findAll(_ parameters: Parameters?, completionHandler: @escaping (Result<[String: Any]>) -> Void) {
    RequestAPI.shared.call("v1/posts", method: .get, parameters: parameters, completion: completionHandler)
  }

  func findById(_ parameters: Parameters?, completionHandler: @escaping (Result<[String: Any]>) -> Void) {
    RequestAPI.shared.call("v1/posts/:id", method: .get, parameters: parameters, completion: completionHandler)
  }

  func create(_ parameters: Parameters?, completionHandler: @escaping (Result<[String: Any]>) -> Void) {
    RequestAPI.shared.call("v1/posts", method: .post, parameters: parameters, completion: completionHandler)
  }
}
