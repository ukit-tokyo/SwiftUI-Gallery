//
//  NotificationRow.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/05/26.
//

import SwiftUI

struct NotificationRow: View {
  private let notification: Notification
  private let userIconTapAction: () -> Void

  init(_ notification: Notification,
       userIconTapAction: @escaping () -> Void) {
    self.notification = notification
    self.userIconTapAction = userIconTapAction
  }

  var body: some View {
    HStack(alignment: .top, spacing: 8) {
      CircleImage(notification.userIcon, diameter: 50, backgroundColor: .green) {
        userIconTapAction()
      }

      VStack(alignment: .leading, spacing: 4) {
        Text(notification.message)
          .font(.smallBold)
          .foregroundColor(.label)
        Text("約4時間前")
          .font(.system(size: 10, weight: .regular))
          .foregroundColor(.labelSecondary)
      }

      Spacer()

      RoundImage(notification.mainImage, radius: 4, sideLength: 50, backgroundColor: .green)
    }
    .background(Color.backgroundView)
    .padding(8)
  }
}

struct NotificationRow_Previews: PreviewProvider {
  static let preview: some View = NotificationRow(
    Notification(id: 0, userIcon: .swift, message: "本日のピックアップにあなたのレビューが選ばれました。", mainImage: .swift)
  ) {}

  static var previews: some View {
    preview
      .previewLayout(.fixed(width: 375, height: 66))
      .preferredColorScheme(.light)

    preview
      .previewLayout(.fixed(width: 375, height: 66))
      .preferredColorScheme(.dark)
  }
}
