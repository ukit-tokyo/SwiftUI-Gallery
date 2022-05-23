//
//  NavigationBarItemModifier.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/05/23.
//

import SwiftUI

private struct NavigationBarIconItem: Identifiable {
  let id: Int
  let icon: Image
  let action: () -> Void
}

struct NavigationBarItemModifier: ViewModifier {
  struct ItemSet {
    let icon: Image, action: () -> Void
  }
  private let leftItems: [NavigationBarIconItem]
  private let rightItems: [NavigationBarIconItem]

  init(leftItems: [ItemSet] = [], rightItems: [ItemSet] = []) {
    self.leftItems = leftItems.enumerated().map {
      NavigationBarIconItem(id: $0, icon: $1.icon, action: $1.action)
    }
    self.rightItems = rightItems.enumerated().map {
      NavigationBarIconItem(id: $0, icon: $1.icon, action: $1.action)
    }
  }

  func body(content: Content) -> some View {
    content
      .toolbar() {
        ToolbarItemGroup(placement: .navigationBarLeading) {
          HStack(spacing: 0) {
            ForEach(leftItems) { item in
              Button(action: item.action) {
                item.icon
              }
              .foregroundColor(.label)
            }
          }
        }
        ToolbarItemGroup(placement: .navigationBarTrailing) {
          HStack(spacing: 0) {
            ForEach(rightItems) { item in
              Button(action: item.action) {
                item.icon
              }
              .foregroundColor(.label)
            }
          }
        }
      }
  }
}
