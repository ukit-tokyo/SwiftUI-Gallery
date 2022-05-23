//
//  GalleryView.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/05/17.
//

import SwiftUI

// MARK: - List
struct GalleryView: View {
  struct Row: Identifiable {
    var id: String { title }
    let title: String
    let destination: AnyView
  }

  private var contents: [Row] = [
    Row(title: "Button", destination: AnyView(ButtonGalleryView())),
    Row(title: "Navigation", destination: AnyView(NavigationGalleryView()))
  ]

  var body: some View {
    NavigationView {
      List(contents) {
        GalleryRow(title: $0.title, destination: $0.destination)
      }
      .navigationBarTitleDisplayMode(.large)
      .navigationTitle("Gallery")
    }
    .accentColor(.label)
  }
}

// MARK: - Row
struct GalleryRow<Destination: View>: View {
  let title: String
  let destination: Destination

  var body: some View {
    NavigationLink(destination: destination) {
      Text(title)
    }
  }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    GalleryView()
  }
}
