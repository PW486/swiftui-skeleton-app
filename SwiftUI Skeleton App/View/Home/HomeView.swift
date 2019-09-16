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
  @State private var showModal: Bool = false
  @EnvironmentObject private var globalState: GlobalState

  func fetch() {
    PostAPI.shared.findAll(nil) { res in
      var postList = [Post]()
      let decoder = JSONDecoder()
      if let value = res.value {
        let json = JSON(value)
        for (_, subJson): (String, JSON) in json {
          print(subJson)
          do {
            let post = try decoder.decode(Post.self, from: subJson.rawData())
            postList.append(post)
          } catch {
            print(error)
          }
        }
        self.globalState.postList = postList
      }
    }
  }

  var body: some View {
    NavigationView {
      List {
        ForEach(globalState.postList, id: \.self) { post in
          NavigationLink(
            destination: PostDetail(post: post)
          ) {
            PostRow(post: post)
          }
        }
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

        self.fetch()
      }
    }
    .sheet(isPresented: $showModal, onDismiss: {
      self.fetch()
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
    HomeView()
  }
}
