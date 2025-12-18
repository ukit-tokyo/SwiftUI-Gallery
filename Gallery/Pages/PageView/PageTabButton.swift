//
//  PageTabButton.swift
//  Gallery
//
//  Created by Taichi Yuki on 2025/09/17.
//

import SwiftUI

struct PageTabButton: View {
  let title: String
  let selected: Bool
  let tapAction: () -> Void

  var body: some View {
    Button(action: {
      tapAction()
    }) {
      Text(title)
        .typography(.bodyBold)
        .foregroundColor(selected ? .blue : .gray.opacity(0.4))
        .frame(maxWidth: .infinity)
        .padding(.vertical, 12)
    }
  }
}

#Preview() {
  PageTabButton(title: "tab", selected: true, tapAction: { print("tapped.") })
}
