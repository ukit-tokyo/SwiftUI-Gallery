//
//  BorderIconTextButton.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/05/19.
//

import SwiftUI

struct BorderIconTextButton: View {
  private let title: String
  private let icon: Image
  private let theme: BorderButtonTheme
  private let font: Font
  private let borderWidth: CGFloat
  private let width: CGFloat?
  private let height: CGFloat?
  private let cornerRadius: CGFloat?
  private let spacing: CGFloat
  private let selectable: Bool
  private let animated: Bool
  private let action: (Bool) -> Void

  init(
    _ title: String,
    icon: Image,
    theme: BorderButtonTheme,
    font: Font,
    borderWidth: CGFloat = 1,
    width: CGFloat? = nil,
    height: CGFloat? = nil,
    cornerRadius: CGFloat? = nil,
    spacing: CGFloat = 8,
    selectable: Bool = false,
    animated: Bool = true,
    action: @escaping (Bool) -> Void
  ) {
    self.title = title
    self.icon = icon
    self.theme = theme
    self.font = font
    self.borderWidth = borderWidth
    self.width = width
    self.height = height
    self.cornerRadius = cornerRadius
    self.spacing = spacing
    self.selectable = selectable
    self.animated = animated
    self.action = action
  }

  var body: some View {
    BorderButton(
      theme: .primary,
      font: font,
      borderWidth: borderWidth,
      width: width,
      height: height,
      cornerRadius: cornerRadius,
      selectable: selectable,
      animated: animated,
      action: action) {
        HStack(spacing: spacing) {
          icon
          Text(title)
        }
      }
  }
}

// MARK: - Preview
struct BorderIconTextButton_Previews: PreviewProvider {
  static let preview: some View = BorderIconTextButton(
    "BorderIconTextButton",
    icon: .magnifyingglass,
    theme: .primary,
    font: .body,
    height: 40) { _ in }

  static var previews: some View {
    preview
      .previewLayout(.fixed(width: 250, height: 60))
      .preferredColorScheme(.light)

    preview
      .previewLayout(.fixed(width: 250, height: 60))
      .preferredColorScheme(.dark)
  }
}
