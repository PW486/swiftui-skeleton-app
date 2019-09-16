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
      Image(systemName: "doc.append")
        .foregroundColor(.red)
        .font(.title)
        .padding(.trailing, 10)
      VStack(alignment: .leading) {
        HStack {
          Text(post.title)
            .bold()
            .lineLimit(1)
          Spacer()
          Text(DateToFormat(post.createdAt))
            .font(.caption)
        }
        Text(post.text)
          .font(.caption)
          .lineLimit(2)
      }
    }
    .frame(height: 70)
  }
}

struct PostRow_Previews: PreviewProvider {
  static var previews: some View {
    PostRow(post: Post(id: 1, title: "Title", text: "Text...", createdAt: "2020-04-06T07:00:00.000Z", updatedAt: "2020-04-06T07:00:00.000Z"))
      .previewLayout(.fixed(width: 300, height: 70))
  }
}
