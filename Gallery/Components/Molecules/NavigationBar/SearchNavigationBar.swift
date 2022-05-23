//
//  SearchNavigationBar.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/05/23.
//

import SwiftUI

struct SearchNavigationBar<Content: View>: View {
  @State var text: String = ""
  private let content: Content

  init(@ViewBuilder content: () -> Content) {
    self.content = content()
  }

  var body: some View {
    VStack {
      SearchBar("キーワードで検索", text: $text)
      content
    }
    .navigationBarHidden(true)
    .navigationBarBackButtonHidden(true)
  }
}

struct SearchNavigationBar_Previews: PreviewProvider {
  static var previews: some View {
    SearchNavigationBar {
      Text("Search")
    }
  }
}
