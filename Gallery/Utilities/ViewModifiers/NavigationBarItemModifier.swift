//
//  NavigationBarItemModifier.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/05/23.
//

import SwiftUI

// MARK: - Extension
extension View {
  func navigationBarItems(
    leftItems: [NavigationBarItemSet] = [],
    rightItems: [NavigationBarItemSet] = []
  ) -> some View {
    modifier(NavigationBarItemModifier(leftItems: leftItems, rightItems: rightItems))
  }
}

// MARK: - Interface
struct NavigationBarItemSet {
  fileprivate let icon: Image?
  fileprivate let text: String?
  fileprivate let action: () -> Void

  init(icon: Image? = nil, text: String? = nil, action: @escaping () -> Void) {
    self.icon = icon
    self.text = text
    self.action = action
  }
}

private struct NavigationBarContentItem: Identifiable {
  let id: Int, icon: Image?, text: String?, action: () -> Void
}

// MARK: - Modifier
struct NavigationBarItemModifier: ViewModifier {
  private let leftItems: [NavigationBarContentItem]
  private let rightItems: [NavigationBarContentItem]

  init(
    leftItems: [NavigationBarItemSet] = [],
    rightItems: [NavigationBarItemSet] = []
  ) {
    self.leftItems = leftItems.enumerated().map {
      NavigationBarContentItem(id: $0, icon: $1.icon, text: $1.text, action: $1.action)
    }
    self.rightItems = rightItems.enumerated().map {
      NavigationBarContentItem(id: $0, icon: $1.icon, text: $1.text, action: $1.action)
    }
  }

  func body(content: Content) -> some View {
    content
      .toolbar() {
        ToolbarItemGroup(placement: .navigationBarLeading) {
          HStack(spacing: 0) {
            ForEach(leftItems) { item in
              Button(action: item.action) {
                if let icon = item.icon { AnyView(icon) }
                if let text = item.text { AnyView(Text(text)) }
              }
              .foregroundColor(.label)
            }
          }
        }
        ToolbarItemGroup(placement: .navigationBarTrailing) {
          HStack(spacing: 0) {
            ForEach(rightItems) { item in
              Button(action: item.action) {
                if let icon = item.icon { AnyView(icon) }
                if let text = item.text { AnyView(Text(text)) }
              }
              .foregroundColor(.label)
            }
          }
        }
      }
  }
}
