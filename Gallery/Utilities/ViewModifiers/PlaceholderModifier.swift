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
    font: Font = .system(size: 16),
    showWhen isShown: Bool,
    alignment: Alignment = .leading,
    color: Color = .labelTertiary
  ) -> some View {

    ZStack(alignment: alignment) {
      Text(title)
        .font(font)
        .opacity(isShown ? 1 : 0)
        .foregroundColor(color)
      self
    }
  }
}
