//
//  NotificationListView.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/05/26.
//

import SwiftUI

struct NotificationListView: View {
  @ObservedObject
  private var viewModel = NotificationListViewModel()

  var body: some View {
    List(viewModel.notifications) {
      NotificationRow($0) {
        print("user icon tapped")
      }
      .listRowInsets(EdgeInsets())
      .listRowBackground(Color.backgroundView)
    }
    .listStyle(.plain)
    .navigationBarTitleDisplayMode(.inline)
    .navigationTitle("お知らせ")
    .onAppear() {
      viewModel.fetch()
    }
  }
}

struct NotificationListView_Previews: PreviewProvider {
  static var previews: some View {
    NotificationListView()
  }
}

// MARK: - ViewModel

final class NotificationListViewModel: ObservableObject {
  @Published var notifications: [Notification] = []

  func fetch() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
      self.notifications = [
        Notification(id: 0, userIcon: .swift, message: "メッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージ", mainImage: .swift),
        Notification(id: 1, userIcon: .swift, message: "メッセージ", mainImage: .swift),
        Notification(id: 3, userIcon: .swift, message: "メッセージ", mainImage: .swift),
        Notification(id: 4, userIcon: .swift, message: "メッセージ", mainImage: .swift),
        Notification(id: 5, userIcon: .swift, message: "メッセージ", mainImage: .swift),
      ]
    }
  }
}

struct Notification: Identifiable {
  let id: Int
  let userIcon: Image
  let message: String
  let mainImage: Image
}
