//
//  ProfileView.swift
//  SwiftUI Skeleton App
//
//  Created by PW486 on 2019/09/16.
//  Copyright © 2019 PW486. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
  @EnvironmentObject private var globalState: GlobalState

  var body: some View {
    VStack {
      Text("Token: \(globalState.accessToken)").padding()
      Button("LogOut") {
        self.globalState.accessToken = ""
        UserDefaults.standard.removeObject(forKey: "access_token")
      }
    }
  }
}

struct ProfileView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileView()
  }
}
