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
    .init(title: "Page 1", color: .blue.opacity(0.2)),
    .init(title: "Page 2", color: .blue.opacity(0.4)),
    .init(title: "Page 3", color: .blue.opacity(0.6)),
  ]

  var body: some View {
    VStack(spacing: 0) {
      HStack(spacing: 0) {
        ForEach(Array(contents.enumerated()), id: \.element.id) { index, content in
          PageTabButton(title: content.title, selected: selectedTab == index) {
            withAnimation {
              selectedTab = index
            }
          }
        }
      }
      TabView(selection: $selectedTab) {
        ForEach(Array(contents.enumerated()), id: \.element.id) { index, content in
          PageContentView(title: content.title, color: content.color)
            .tag(index)
        }
      }
      .tabViewStyle(.page(indexDisplayMode: .never))
    }
  }
}

#Preview {
  PageView()
}
