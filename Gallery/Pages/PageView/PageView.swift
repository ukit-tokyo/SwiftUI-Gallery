//
//  TabView.swift
//  Gallery
//
//  Created by Taichi Yuki on 2025/09/17.
//

import SwiftUI

struct PageView: View {
  struct Content: Identifiable {
    var id: String { title }
    let title: String
    let color: Color
  }

  @State var selectedTab: Int = 0

  let contents: [Content] = [
    .init(title: "Page 1", color: .gray.opacity(0.3)),
    .init(title: "Page 2", color: .gray.opacity(0.6)),
    .init(title: "Page 3", color: .gray.opacity(0.9)),
  ]

  var body: some View {
    TabView(selection: $selectedTab) {
      ForEach(contents) { content in
        PageContentView(title: content.title, color: content.color)
      }
    }
    .tabViewStyle(.page(indexDisplayMode: .never))
  }
}

#Preview {
  PageView()
}
