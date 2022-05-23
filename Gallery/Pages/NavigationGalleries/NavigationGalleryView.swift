//
//  NavigationGalleryView.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/05/23.
//

import SwiftUI

struct NavigationGalleryView: View {
  struct Row: Identifiable {
    var id: String { title }
    let title: String
    let destination: AnyView
  }

  private var contents: [Row] = [
    Row(title: "Mypage", destination: AnyView(MypageNavigationGalleyView()))
  ]
  
  var body: some View {
    List(contents) {
      GalleryRow(title: $0.title, destination: $0.destination)
    }
    .navigationBarTitleDisplayMode(.large)
    .navigationTitle("Navigation Gallery")
  }
}

struct NavigationGalleryView_Previews: PreviewProvider {
  static let preview: some View = NavigationGalleryView()

  static var previews: some View {
    preview
      .preferredColorScheme(.dark)
  }
}
