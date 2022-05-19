//
//  BorderIconButton.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/05/19.
//

import SwiftUI

struct BorderIconButton: View {
  private let icon: Image
  private let theme: BorderButtonTheme
  private let borderWidth: CGFloat
  private let size: CGFloat?
  private let iconSize: CGFloat
  private let selectable: Bool
  private let animated: Bool
  private let action: (Bool) -> Void

  init(
    _ icon: Image,
    theme: BorderButtonTheme,
    borderWidth: CGFloat = 1,
    size: CGFloat? = nil,
    iconSize: CGFloat,
    selectable: Bool = false,
    animated: Bool = true,
    action: @escaping (Bool) -> Void
  ) {
    self.icon = icon
    self.theme = theme
    self.borderWidth = borderWidth
    self.size = size
    self.iconSize = iconSize
    self.selectable = selectable
    self.animated = animated
    self.action = action
  }

  var body: some View {
    BorderButton(
      theme: .primary,
      font: .system(size: iconSize),
      borderWidth: borderWidth,
      width: size,
      height: size,
      selectable: selectable,
      animated: animated,
      action: action) {
        icon.frame(width: iconSize, height: iconSize)
      }
  }
}

// MARK: - Preview
struct BorderIconButton_Previews: PreviewProvider {
  static let preview: some View = BorderIconButton(
    .magnifyingglass,
    theme: .primary,
    iconSize: 20) { _ in }

  static var previews: some View {
    preview
      .previewLayout(.fixed(width: 250, height: 60))
      .preferredColorScheme(.light)

    preview
      .previewLayout(.fixed(width: 250, height: 60))
      .preferredColorScheme(.dark)
  }
}
