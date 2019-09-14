//
//  LogInView.swift
//  SwiftUI Skeleton App
//
//  Created by PW486 on 2019/09/14.
//  Copyright © 2019 PW486. All rights reserved.
//

import Alamofire
import SwiftUI
import SwiftyJSON

struct Login: Codable {
  let email: String
  let password: String
}

// MARK: - test

struct LogInView: View {
  @State var email: String = ""
  @State var password: String = ""

  func req() {
    let parameters: Parameters = [
      "email": "test@test.com",
      "password": "test",
    ]
    Alamofire.request("https://httpbin.org/post",
                      method: .post,
                      parameters: parameters,
                      encoding: URLEncoding.default).responseJSON { response in
      debugPrint(response)
    }
  }

  var body: some View {
    VStack {
      Text("SwiftUI Skeleton App - Log In View")
      TextField("Email", text: $email)
      TextField("Password", text: $password)
      Button("Log In") {
        print("Log In Succeed")
      }
    }
    .padding()
    .onAppear {
      self.req()
    }
  }
}

struct LogInView_Previews: PreviewProvider {
  static var previews: some View {
    LogInView()
  }
}
