//
//  LogInView.swift
//  SwiftUI Skeleton App
//
//  Created by PW486 on 2019/09/14.
//  Copyright © 2019 PW486. All rights reserved.
//

import SwiftUI

struct LogInView: View {
  @State var email: String = ""
  @State var password: String = ""

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
  }
}

struct LogInView_Previews: PreviewProvider {
  static var previews: some View {
    LogInView()
  }
}
