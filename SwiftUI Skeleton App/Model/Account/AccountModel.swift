//
//  AccountModel.swift
//  SwiftUI Skeleton App
//
//  Created by PW486 on 2019/09/15.
//  Copyright © 2019 PW486. All rights reserved.
//

import SwiftUI

struct Account: Codable {
  var id: Int
  var email: String
  var name: String
  var createdAt: String
  var updatedAt: String
}
