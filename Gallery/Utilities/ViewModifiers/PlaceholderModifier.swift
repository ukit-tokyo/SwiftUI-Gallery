//
//  PlaceholderModifier.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/05/23.
//

import SwiftUI

extension View {
  func placeholder(
    _ title: String,
    showWhen: Bool,
    alignment: Alignment = .leading,
    color: Color = .labelTertiary
  ) -> some View {

    ZStack(alignment: alignment) {
      Text(title)
        .font(.system(size: 16))
        .opacity(showWhen ? 1 : 0)
        .foregroundColor(color)
      self
    }
  }
}
