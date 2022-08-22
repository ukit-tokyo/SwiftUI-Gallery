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

  private let components: [Row] = [
    Row(title: "Button", destination: AnyView(ButtonGalleryView())),
    Row(title: "Navigation", destination: AnyView(NavigationGalleryView())),
    Row(title: "Search Bar", destination: AnyView(SearchBarGalleryView())),
    Row(title: "Rating Star", destination: AnyView(RatingStarGalleryView())),
    Row(title: "Horizontal List", destination: AnyView(HorizontalListGalleryView())),
  ]

  private let pages: [Row] = [
    Row(title: "Notification", destination: AnyView(NotificationListView())),
  ]

  var body: some View {
    NavigationView {
      List {
        Section(header: Text("Components")) {
          ForEach(components) {
            GalleryRow(title: $0.title, destination: $0.destination)
          }
        }
        Section(header: Text("Pages")) {
          ForEach(pages) {
            GalleryRow(title: $0.title, destination: $0.destination)
          }
        }
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
