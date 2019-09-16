//
//  PostModel.swift
//  SwiftUI Skeleton App
//
//  Created by PW486 on 2019/09/15.
//  Copyright © 2019 PW486. All rights reserved.
//

struct Post: Codable, Hashable {
  var id: Int
  var title: String
  var text: String
  var photo: String?
  var createdAt: String
  var updatedAt: String
}
