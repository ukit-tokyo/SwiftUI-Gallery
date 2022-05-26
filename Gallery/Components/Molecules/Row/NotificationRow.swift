//
//  NotificationRow.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/05/26.
//

import SwiftUI

struct NotificationRow: View {
  var body: some View {
    HStack(alignment: .top, spacing: 8) {
      CircleImage(.swift, diameter: 50, backgroundColor: .green) {
        print("tap image")
      }

      VStack(alignment: .leading, spacing: 4) {
        Text("本日のピックアップにあなたのレビューが選ばれました。")
          .font(.smallBold)
          .foregroundColor(.label)
        Text("約4時間前")
          .font(.system(size: 10, weight: .regular))
          .foregroundColor(.labelSecondary)
      }

      RoundImage(.swift, radius: 4, sideLength: 50, backgroundColor: .green) {
      }
    }
    .background(Color.backgroundView)
    .padding([.top, .bottom], 8)
    .padding([.leading, .trailing], 16)
  }
}

struct NotificationRow_Previews: PreviewProvider {
  static let preview: some View = NotificationRow()

  static var previews: some View {
    preview
      .previewLayout(.fixed(width: 375, height: 66))
      .preferredColorScheme(.light)

    preview
      .previewLayout(.fixed(width: 375, height: 66))
      .preferredColorScheme(.dark)
  }
}
