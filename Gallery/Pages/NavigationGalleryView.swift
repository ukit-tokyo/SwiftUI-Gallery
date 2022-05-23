//
//  NavigationGalleryView.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/05/23.
//

import SwiftUI

struct NavigationGalleryView: View {
  var body: some View {
    Text("Navigation Gallery")
      .navigationBarTitleDisplayMode(.inline)
      .navigationTitle("Navigation Gallery")
      .navigationBarItems(
        leftItems: [
          .init(icon: Image.magnifyingglass) {}
        ],
        rightItems: [
          .init(icon: .gearshape) {},
          .init(text: "保存") {}
        ]
      )
  }
}

struct NavigationGalleryView_Previews: PreviewProvider {
  static let preview: some View = NavigationGalleryView()

  static var previews: some View {
    preview
      .preferredColorScheme(.dark)
  }
}
