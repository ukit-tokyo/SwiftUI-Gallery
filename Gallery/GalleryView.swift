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
    Row(title: "Snack Bar", destination: AnyView(SnackbarGalleryView())),
    Row(title: "Loading View", destination: AnyView(LoadingGalleryView())),
    Row(title: "Instant Message", destination: AnyView(InstantMessageGalleryView())),
    Row(title: "Tag Layout", destination: AnyView(TagLayoutView())),
  ]

  private let pages: [Row] = [
    Row(title: "Notification", destination: AnyView(NotificationListView())),
    Row(title: "Page View", destination: AnyView(PageView(selectedId: "Page 1"))),
    Row(title: "Free Canvas", destination: AnyView(CanvasView())),
  ]

  private let advanced: [Row] = [
    Row(title: "Flip Book Effect", destination: AnyView(FlipBookView())),
    Row(title: "Glow Test", destination: AnyView(GlowTestView())),
    Row(title: "Gradient Border Animations", destination: AnyView(GradientBorderAnimationsView())),
  ]

  private let freeCanvas: [Row] = [
    Row(title: "Freshers Task Card", destination: AnyView(FreshersTaskCard(
      title: "ようこそ👋",
      description: "使い方を覚えてポイントをもらおう！",
      totalProgress: (value: 1, total: 3),
      reward: 30,
      taskTitle: "いいねを５回しよう",
      taskReward: 10,
      taskProgress: (value: 1, total: 5)))),
    Row(title: "Pager Card", destination: AnyView(PagerCard())),
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
        Section(header: Text("Advanced")) {
          ForEach(advanced) {
            GalleryRow(title: $0.title, destination: $0.destination)
          }
        }
        Section(header: Text("Free Canvas")) {
          ForEach(freeCanvas) {
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
