//
//  GlobalState.swift
//  SwiftUI Skeleton App
//
//  Created by PW486 on 2019/09/16.
//  Copyright © 2019 PW486. All rights reserved.
//

import Foundation

final class GlobalState: ObservableObject {
  @Published var email: String = ""
  @Published var name: String = ""
  @Published var accessToken: String = UserDefaults.standard.string(forKey: "access_token") ?? ""
  @Published var postList: [Post] = []
}
