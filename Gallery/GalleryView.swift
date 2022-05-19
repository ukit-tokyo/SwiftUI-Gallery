//
//  GalleryView.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/05/17.
//

import SwiftUI

struct GalleryView: View {
  struct Row<Destination: View>: Identifiable {
    var id: String { title }
    let title: String
    let destination: Destination
  }

  private var rows: [Row] = [
    Row(title: "Button", destination: ButtonGalleryView())
  ]

  var body: some View {
    NavigationView {
      List(rows) { row in
        NavigationLink(destination: row.destination) {
          Text(row.title)
        }
      }
      .navigationBarTitleDisplayMode(.large)
      .navigationTitle("Gallery")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    GalleryView()
  }
}
