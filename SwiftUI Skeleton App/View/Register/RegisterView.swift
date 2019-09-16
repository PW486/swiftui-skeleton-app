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
  @Environment(\.presentationMode) private var presentation: Binding<PresentationMode>

  @State private var email: String = ""
  @State private var name: String = ""
  @State private var password: String = ""

  func stateReset() {
    email = ""
    name = ""
    password = ""
  }

  var registerFormData: Parameters {
    [
      "email": email,
      "name": name,
      "password": password,
    ]
  }

  var body: some View {
    VStack {
      Image(systemName: "person.crop.circle.badge.plus")
        .font(.largeTitle)
      Text("REGISTER")
        .bold()
        .font(.largeTitle)
      Text("SwiftUI Skeleton App")
        .font(.subheadline)

      TextField("Email", text: $email)
        .textFieldStyle(RoundedBorderTextFieldStyle())
      TextField("Name", text: $name)
        .textFieldStyle(RoundedBorderTextFieldStyle())
      SecureField("Password", text: $password)
        .textFieldStyle(RoundedBorderTextFieldStyle())

      HStack {
        Button(action: {
          self.presentation.wrappedValue.dismiss()
        }, label: {
          HStack {
            Image(systemName: "xmark.circle")
            Text("Cancel")
          }
          .foregroundColor(Color.white)
          .frame(width: 95, height: 32)
          .background(Color.blue)
          .cornerRadius(5)
        })

        Button(action: {
          AccountAPI.signup(self.registerFormData) { res in
            switch res {
            case .success:
              if let json = res.value, let accessToken = json["access_token"].string {
                self.globalState.accessToken = accessToken
              }
              self.stateReset()
              self.presentation.wrappedValue.dismiss()
            case let .failure(error):
              print(error)
            }
          }
        }, label: {
          HStack {
            Image(systemName: "checkmark.circle")
            Text("Sign Up")
          }
          .foregroundColor(Color.white)
          .frame(width: 110, height: 32)
          .background(Color.blue)
          .cornerRadius(5)
        })
      }
    }
    .padding(48)
  }
}

struct RegisterView_Previews: PreviewProvider {
  static var previews: some View {
    RegisterView().environmentObject(GlobalState())
  }
}
