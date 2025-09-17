//
//  TabView.swift
//  Gallery
//
//  Created by Taichi Yuki on 2025/09/17.
//

import SwiftUI

struct PageView: View {
  @State var selectedTab: Int = 0

  var body: some View {
    TabView(selection: $selectedTab) {
      Text("Page-0")
        .tag(0)
      Text("Page-1")
        .tag(1)
      Text("Page-2")
        .tag(2)
    }
    .tabViewStyle(.page(indexDisplayMode: .never))
  }
}

#Preview {
  PageView()
}
