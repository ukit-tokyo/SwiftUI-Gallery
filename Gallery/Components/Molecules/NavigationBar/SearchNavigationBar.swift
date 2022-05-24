//
//  SearchNavigationBar.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/05/23.
//

import SwiftUI

struct SearchNavigationBar<Content: View>: View {
  @Binding var text: String

  private let leftItems: [NavigationBarContentItem]
  private let rightItems: [NavigationBarContentItem]
  private let content: Content

  init(
    text: Binding<String>,
    leftItems: [NavigationBarItemSet] = [],
    rightItems: [NavigationBarItemSet] = [],
    @ViewBuilder content: () -> Content
  ) {
    self._text = text
    self.leftItems = leftItems.enumerated().map {
      NavigationBarContentItem(id: $0, icon: $1.icon, text: $1.text, action: $1.action)
    }
    self.rightItems = rightItems.enumerated().map {
      NavigationBarContentItem(id: $0, icon: $1.icon, text: $1.text, action: $1.action)
    }
    self.content = content()
  }

  var body: some View {
    VStack {
      HStack(spacing: 0) {

        if !leftItems.isEmpty {
          HStack(spacing: 6) {
            ForEach(leftItems) { item in
              Button(action: item.action) {
                if let icon = item.icon { AnyView(icon) }
                if let text = item.text { AnyView(Text(text)) }
              }
              .foregroundColor(.label)
            }
          }
          .padding(.leading, 16)
        }

        SearchBar("キーワードで検索", text: $text)

        if !rightItems.isEmpty {
          HStack(spacing: 6) {
            ForEach(rightItems) { item in
              Button(action: item.action) {
                if let icon = item.icon { AnyView(icon) }
                if let text = item.text { AnyView(Text(text)) }
              }
              .foregroundColor(.label)
            }
          }
          .padding(.trailing, 16)
        }
      }

      content
    }
    .navigationBarHidden(true)
  }
}

//struct SearchNavigationBar_Previews: PreviewProvider {
//  @State var text: String = ""
//
//  static var previews: some View {
//    SearchNavigationBar(text: $text, canBack: true) {
//      Text("Search")
//    }
//  }
//}
