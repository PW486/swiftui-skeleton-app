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
  @Environment(\.presentationMode) var presentation: Binding<PresentationMode>
  @State private var showModal = false
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

      HStack {
        Button("Cancel") {
          self.presentation.wrappedValue.dismiss()
        }
        Button("Log In") {
          AccountAPI.signin(self.logInFormData) { res in
            switch res {
            case .success:
              if let json = res.value as? JSON, let accessToken = json["access_token"].string {
                self.globalState.accessToken = accessToken
              }
            case let .failure(error):
              print(error)
            }
          }
        }
        Button("Register") {
          self.showModal = true
        }
      }
    }
    .padding()
    .onAppear {
      print("On Appear")
    }.sheet(isPresented: $showModal, content: {
      RegisterView().environmentObject(self.globalState)
    })
  }
}

struct LogInView_Previews: PreviewProvider {
  static var previews: some View {
    LogInView()
  }
}
