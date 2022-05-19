//
//  BorderTextButton.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/05/19.
//

import SwiftUI

struct BorderTextButton: View {
  @Environment(\.isEnabled) var isEnabled: Bool

  private let title: String
  private let theme: BorderButtonTheme
  private let font: Font
  private let borderWidth: CGFloat
  private let width: CGFloat?
  private let height: CGFloat?
  private let cornerRadius: CGFloat?
  private let selectable: Bool
  private let animated: Bool
  private let action: (Bool) -> Void

  init(
    _ title: String,
    theme: BorderButtonTheme,
    font: Font,
    borderWidth: CGFloat = 1,
    width: CGFloat? = nil,
    height: CGFloat? = nil,
    cornerRadius: CGFloat? = nil,
    selectable: Bool = false,
    animated: Bool = true,
    action: @escaping (Bool) -> Void
  ) {
    self.title = title
    self.theme = theme
    self.font = font
    self.borderWidth = borderWidth
    self.width = width
    self.height = height
    self.cornerRadius = cornerRadius
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
        Text(title)
      }
  }
}

struct BorderTextButton_Previews: PreviewProvider {
  static let preview: some View = BorderTextButton(
    "BorderTextButton",
    theme: .primary,
    font: .body,
    width: 180,
    height: 40) { _ in }

  static var previews: some View {
    preview
      .previewLayout(.fixed(width: 220, height: 70))
      .preferredColorScheme(.light)

    preview
      .previewLayout(.fixed(width: 220, height: 70))
      .preferredColorScheme(.dark)
  }
}
