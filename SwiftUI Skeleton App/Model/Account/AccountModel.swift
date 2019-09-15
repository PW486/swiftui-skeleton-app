//
//  AccountModel.swift
//  SwiftUI Skeleton App
//
//  Created by PW486 on 2019/09/15.
//  Copyright © 2019 PW486. All rights reserved.
//

import Combine
import SwiftUI

struct Account: Codable {
  var email: String
  var name: String
  var accessToken: String
}

final class AccountData: ObservableObject {
  @Published var email: String = ""
  @Published var name: String = ""
  @Published var accessToken: String = UserDefaults.standard.string(forKey: "access_token") ?? ""
}
