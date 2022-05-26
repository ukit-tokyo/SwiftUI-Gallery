//
//  SearchBarGalleryView.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/05/23.
//

import SwiftUI

struct SearchBarGalleryView: View {
  @State private var text: String = ""

  var body: some View {
    VStack {
      SearchBar("キーワードで絞り込む", text: $text)
      Spacer()
    }
    .navigationBarTitleDisplayMode(.inline)
    .navigationTitle("Search Bar")
  }
}

struct SearchBarGalleryView_Previews: PreviewProvider {
  static var previews: some View {
    SearchBarGalleryView()
  }
}
