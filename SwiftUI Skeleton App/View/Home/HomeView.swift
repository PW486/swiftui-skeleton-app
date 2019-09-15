//
//  HomeView.swift
//  SwiftUI Skeleton App
//
//  Created by PW486 on 2019/09/14.
//  Copyright © 2019 PW486. All rights reserved.
//

import SwiftUI

struct HomeView: View {
  var body: some View {
    NavigationView {
      List {
        Text("Hello World")
        Text("Hello World")
        Text("Hello World")
      }
      .navigationBarTitle(Text("Navigation Title"))
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
