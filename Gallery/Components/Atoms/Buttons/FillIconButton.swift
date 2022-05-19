//
//  FillIconButton.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/05/19.
//

import SwiftUI

struct FillIconButton: View {
  @Environment(\.isEnabled) var isEnabled: Bool

  private let icon: Image
  private let theme: FillButtonTheme
  private let size: CGFloat?
  private let iconSize: CGFloat
  private let animated: Bool
  private let action: () -> Void

  init(
    _ icon: Image,
    theme: FillButtonTheme,
    size: CGFloat? = nil,
    iconSize: CGFloat,
    animated: Bool = true,
    action: @escaping () -> Void
  ) {
    self.icon = icon
    self.theme = theme
    self.size = size
    self.iconSize = iconSize
    self.animated = animated
    self.action = action
  }

  var body: some View {
    FillButton(
      theme: theme,
      font: .system(size: iconSize),
      width: size,
      height: size,
      animated: animated,
      action: action) {
        icon
      }
  }
}

struct FillIconButton_Previews: PreviewProvider {
  static let preview: some View = FillIconButton(
    .magnifyingglass,
    theme: .primary,
    size: 34,
    iconSize: 16) {}

  static var previews: some View {
    preview
      .previewLayout(.fixed(width: 100, height: 100))
      .preferredColorScheme(.light)

    preview
      .previewLayout(.fixed(width: 100, height: 100))
      .preferredColorScheme(.dark)
  }
}
