//
//  NotificationListView.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/05/26.
//

import SwiftUI

struct NotificationListView: View {
  var body: some View {
    let row = NotificationRow()
      .listRowInsets(EdgeInsets())
      .listRowBackground(Color.backgroundView)
    List {
      row
      row
      row
      row
      row
    }
    .listStyle(PlainListStyle())
    .navigationBarTitleDisplayMode(.inline)
    .navigationTitle("お知らせ")
  }
}

struct NotificationListView_Previews: PreviewProvider {
  static var previews: some View {
    NotificationListView()
  }
}
