//
//  PostDetail.swift
//  SwiftUI Skeleton App
//
//  Created by PW486 on 2019/09/16.
//  Copyright © 2019 PW486. All rights reserved.
//

import SwiftUI

struct PostDetail: View {
  @EnvironmentObject private var globalState: GlobalState
  var post: Post

  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        Image(systemName: "doc.append")
          .foregroundColor(.red)
          .font(.title)
          .padding(.trailing, 10)
        Text(post.title)
          .bold()
        Spacer()
        Text(DateToFormat(post.createdAt))
          .font(.caption)
      }
      Divider()
      Text(post.text)
      Spacer()
      Divider()
      HStack {
        Spacer()
        Text("SwiftUI Skeleton App")
          .font(.caption)
        Spacer()
      }
    }
    .navigationBarTitle(Text("Post Detail"))
    .padding()
  }
}

struct PostDetail_Previews: PreviewProvider {
  static var previews: some View {
    PostDetail(post: Post(id: 1, title: "Title", text: "Text...", createdAt: "2020-04-06T07:00:00.000Z", updatedAt: "2020-04-06T07:00:00.000Z"))
      .environmentObject(GlobalState())
  }
}
