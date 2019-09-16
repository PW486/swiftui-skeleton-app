//
//  PostAPI.swift
//  SwiftUI Skeleton App
//
//  Created by PW486 on 2019/09/15.
//  Copyright © 2019 PW486. All rights reserved.
//

import Alamofire
import SwiftUI
import SwiftyJSON

struct PostAPI {
  static func findAll(_ parameters: Parameters?, completion: @escaping (Result<Any>) -> Void) {
    RequestAPI.call("v1/posts", method: .get, parameters: parameters, completion: completion)
  }

  static func findById(_ parameters: Parameters?, completion: @escaping (Result<Any>) -> Void) {
    RequestAPI.call("v1/posts/:id", method: .get, parameters: parameters, completion: completion)
  }

  static func create(_ parameters: Parameters?, completion: @escaping (Result<Any>) -> Void) {
    RequestAPI.call("v1/posts", method: .post, parameters: parameters, completion: completion)
  }
}
