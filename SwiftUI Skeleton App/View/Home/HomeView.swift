//
//  HomeView.swift
//  SwiftUI Skeleton App
//
//  Created by PW486 on 2019/09/14.
//  Copyright © 2019 PW486. All rights reserved.
//

import SwiftUI

struct HomeView: View {
  @State private var showModal = false

  var body: some View {
    NavigationView {
      List {
        Text("Hello World")
        Text("Hello World")
        Text("Hello World")
      }
      .navigationBarItems(trailing:
        Button(action: {
          self.showModal = true
        }, label: {
          Image(systemName: "person.circle")
      }))
      .navigationBarTitle(Text("Skeleton"), displayMode: .inline)
      .onAppear {
        if UserDefaults.standard.string(forKey: "access_token") == nil {
          self.showModal = true
        }
//        PostAPI.shared.findAll(nil) {_ in
//
//        }
      }
    }.sheet(isPresented: $showModal, content: {
      LogInView()
    })
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
