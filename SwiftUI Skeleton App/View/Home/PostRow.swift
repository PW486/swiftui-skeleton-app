//
//  PostRow.swift
//  SwiftUI Skeleton App
//
//  Created by PW486 on 2019/09/16.
//  Copyright © 2019 PW486. All rights reserved.
//

import SwiftUI

struct PostRow: View {
  var post: Post

  var body: some View {
    HStack {
      VStack {
        Text(post.title)
        Text(post.text)
      }
      Text(post.createdAt)
    }
  }
}

struct PostRow_Previews: PreviewProvider {
  static var previews: some View {
    let globalState = GlobalState()
    return PostRow(post: globalState.postList[0])
  }
}
