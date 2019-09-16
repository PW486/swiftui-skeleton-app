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
      HStack {
        Image(systemName: "link.circle")
        Text("Token")
          .bold()
        Spacer()
      }
      Text(globalState.accessToken)
        .font(.caption)
      Divider()
      Button(action: {
        self.globalState.accessToken = ""
        UserDefaults.standard.removeObject(forKey: "access_token")
      }, label: {
        Image(systemName: "person.crop.circle.badge.xmark")
          .foregroundColor(.red)
          .font(.title)
          .padding(.leading, -5)
        Text("Logout")
          .foregroundColor(.red)
          .bold()
      })
        .padding()
    }
    .padding(48)
  }
}

struct ProfileView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileView().environmentObject(GlobalState())
  }
}
