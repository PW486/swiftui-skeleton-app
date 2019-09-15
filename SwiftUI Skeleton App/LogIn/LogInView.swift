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

struct Account: Codable {
  var email: String
  var name: String
  var accessToken: String
}

struct AccountAPI {
  static let shared = AccountAPI()

  func singin(_ parameters: Parameters) {
    Alamofire.request("http://localhost:3000/api/v1/signin", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { res in
      switch res.result {
      case .success:
        let json = JSON(res.result.value)
        print(json)
      case let .failure(err):
        print(err.localizedDescription)
      }
    }
  }
}

struct LogInView: View {
  @State var email: String = ""
  @State var password: String = ""

  var logInFormData: Parameters {
    [
      "email": email,
      "password": password,
    ]
  }

  var body: some View {
    VStack {
      Text("SwiftUI Skeleton App - Log In View")
      TextField("Email", text: $email)
        .textFieldStyle(RoundedBorderTextFieldStyle())
      SecureField("Password", text: $password)
        .textFieldStyle(RoundedBorderTextFieldStyle())
      Button("Log In") {
        AccountAPI.shared.singin(self.logInFormData)
      }
    }
    .padding()
    .onAppear {
      print("On Appear")
    }
  }
}

struct LogInView_Previews: PreviewProvider {
  static var previews: some View {
    LogInView()
  }
}
