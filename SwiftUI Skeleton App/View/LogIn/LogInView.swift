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

struct LogInView: View {
  @EnvironmentObject private var globalState: GlobalState
  @Environment(\.presentationMode) private var presentation: Binding<PresentationMode>

  @State private var showModal = false
  @State private var email: String = ""
  @State private var password: String = ""

  var logInFormData: Parameters {
    [
      "email": email,
      "password": password,
    ]
  }

  var body: some View {
    VStack {
      Image(systemName: "link.circle")
        .font(.largeTitle)
      Text("LOG IN")
        .bold()
        .font(.largeTitle)
      Text("SwiftUI Skeleton App")
        .font(.subheadline)

      TextField("Email", text: $email)
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
          AccountAPI.signin(self.logInFormData) { res in
            switch res {
            case .success:
              if let json = res.value, let accessToken = json["access_token"].string {
                self.globalState.accessToken = accessToken
              }
            case let .failure(error):
              print(error)
            }
          }
        }, label: {
          HStack {
            Image(systemName: "checkmark.circle")
            Text("Log In")
          }
          .foregroundColor(Color.white)
          .frame(width: 90, height: 32)
          .background(Color.blue)
          .cornerRadius(5)
        })

        Button(action: {
          self.showModal = true
        }, label: {
          HStack {
            Image(systemName: "person.crop.circle.badge.plus")
            Text("Register")
          }
          .foregroundColor(Color.white)
          .frame(width: 110, height: 32)
          .background(Color.blue)
          .cornerRadius(5)
        })
      }
    }
    .padding(48)
    .sheet(isPresented: $showModal, content: {
      RegisterView().environmentObject(self.globalState)
    })
  }
}

struct LogInView_Previews: PreviewProvider {
  static var previews: some View {
    LogInView().environmentObject(GlobalState())
  }
}
