//
//  RegisterView.swift
//  SwiftUI Skeleton App
//
//  Created by PW486 on 2019/09/14.
//  Copyright © 2019 PW486. All rights reserved.
//

import Alamofire
import SwiftUI
import SwiftyJSON

struct RegisterView: View {
  @EnvironmentObject private var globalState: GlobalState
  @Environment(\.presentationMode) var presentation: Binding<PresentationMode>
  @State var email: String = ""
  @State var name: String = ""
  @State var password: String = ""

  var registerFormData: Parameters {
    [
      "email": email,
      "name": name,
      "password": password,
    ]
  }

  var body: some View {
    VStack {
      Text("SwiftUI Skeleton App - Register View")
      TextField("Email", text: $email)
        .textFieldStyle(RoundedBorderTextFieldStyle())
      TextField("Name", text: $name)
        .textFieldStyle(RoundedBorderTextFieldStyle())
      SecureField("Password", text: $password)
        .textFieldStyle(RoundedBorderTextFieldStyle())
      HStack {
        Button("Cancel") {
          self.presentation.wrappedValue.dismiss()
        }
        Button("Sign Up") {
          AccountAPI.shared.signup(self.registerFormData) { res in
            switch res {
            case .success:
              if let json = res.value as? JSON, let accessToken = json["access_token"].string {
                self.globalState.accessToken = accessToken
              }
              self.presentation.wrappedValue.dismiss()
            case let .failure(error):
              print(error)
            }
          }
        }
      }
    }
    .padding()
    .onAppear {
      print("On Appear")
    }
  }
}

struct RegisterView_Previews: PreviewProvider {
  static var previews: some View {
    RegisterView()
  }
}
