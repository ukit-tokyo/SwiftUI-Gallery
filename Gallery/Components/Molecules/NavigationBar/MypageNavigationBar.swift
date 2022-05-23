//
//  MypageNavigationBar.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/05/23.
//

import SwiftUI

struct MypageNavigationBar<Content: View>: View {
  private let title: String
  private let userSearchAction: () -> Void
  private let hashtagEditAction: () -> Void
  private let settingAction: () -> Void
  private let content: Content

  init(
    _ title: String,
    userSearchAction: @escaping () -> Void,
    hashtagEditAction: @escaping () -> Void,
    settingAction: @escaping () -> Void,
    @ViewBuilder content: () -> Content
  ) {
    self.title = title
    self.userSearchAction = userSearchAction
    self.hashtagEditAction = hashtagEditAction
    self.settingAction = settingAction
    self.content = content()
  }

  var body: some View {
    content
      .navigationBarTitleDisplayMode(.inline)
      .navigationTitle(title)
      .navigationBarBackButtonHidden(true)
      .navigationBarItems(
        leftItems: [
          .init(icon: .magnifyingglass, action: userSearchAction)
        ],
        rightItems: [
          .init(icon: .squareAndPencil, action: hashtagEditAction),
          .init(icon: .gearshape, action: settingAction),
        ]
      )
  }
}
