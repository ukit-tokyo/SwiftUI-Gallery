//
//  TagLayoutView.swift
//  Gallery
//
//  Created by Taichi Yuki on 2026/03/13.
//

import SwiftUI

/// 自動折り返しタグレイアウト
struct TagLayoutView: View {
  let items = [
    "Swift", "SwiftUI", "LazyVGrid",
    "Combine", "Xcode", "iOS",
    "WidgetKit", "Live Activity",
    "Swift Package Manager", "CI/CD",
    "Networking", "Combine", "SwiftUI",
  ]

  var body: some View {
    FlowLayout(spacing: 8) {
      ForEach(items, id: \.self) { text in
        Text(text)
          .font(.caption)
          .foregroundStyle(Color(.red))
          .lineLimit(1)
          .padding(.horizontal, 12)
          .padding(.vertical, 8)
          .background(
            Capsule()
              .fill(.red.opacity(0.1))
          )
      }
    }
    .padding()
  }
}

#Preview {
  TagLayoutView()
}
