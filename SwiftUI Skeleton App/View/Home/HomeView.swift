//
//  HomeView.swift
//  SwiftUI Skeleton App
//
//  Created by PW486 on 2019/09/14.
//  Copyright © 2019 PW486. All rights reserved.
//

import SwiftUI
import SwiftyJSON

struct HomeView: View {
  @EnvironmentObject private var globalState: GlobalState
  @State private var showModal: Bool = false

  func getPostList() {
    PostAPI.findAll(nil) { res in
      if let json = res.value {
        let decoder = JSONDecoder()
        do {
          let postList = try decoder.decode([Post].self, from: json.rawData())
          self.globalState.postList = postList
        } catch {
          print(error.localizedDescription)
        }
      }
    }
  }

  var profileItem: some View {
    Button(action: {
      self.showModal.toggle()
    }, label: {
      Image(systemName: "person.crop.circle")
        .imageScale(.large)
    })
  }

  var body: some View {
    NavigationView {
      List {
        ForEach(globalState.postList, id: \.self) { post in
          NavigationLink(destination: PostDetail(post: post)) {
            PostRow(post: post)
          }
        }
      }
      .navigationBarTitle(Text("Skeleton"), displayMode: .inline)
      .navigationBarItems(trailing: profileItem)
    }
    .onAppear {
      self.globalState.accessToken == "" ? self.showModal.toggle() : self.getPostList()
    }
    .sheet(isPresented: $showModal, onDismiss: {
      self.getPostList()
    }, content: {
      if self.globalState.accessToken == "" {
        LogInView().environmentObject(self.globalState)
      } else {
        ProfileView().environmentObject(self.globalState)
      }
    })
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView().environmentObject(GlobalState())
  }
}
