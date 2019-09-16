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

  var postIndex: Int {
    globalState.postList.firstIndex(where: { $0.id == post.id })!
  }

  var body: some View {
    VStack {
      Text(post.title)
      Text(post.text)
    }
  }
}

struct PostDetail_Previews: PreviewProvider {
  static var previews: some View {
    let globalState = GlobalState()
    return PostDetail(post: globalState.postList[0])
      .environmentObject(globalState)
  }
}
