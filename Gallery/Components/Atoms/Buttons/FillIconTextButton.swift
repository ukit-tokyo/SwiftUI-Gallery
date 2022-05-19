//
//  FillIconTextButton.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/05/19.
//

import SwiftUI

struct FillIconTextButton: View {
  @Environment(\.isEnabled) var isEnabled: Bool

  private let title: String
  private let icon: Image
  private let theme: FillButtonTheme
  private let font: Font
  private let width: CGFloat?
  private let height: CGFloat?
  private let cornerRadius: CGFloat?
  private let spacing: CGFloat
  private let animated: Bool
  private let action: () -> Void

  init(
    _ title: String,
    icon: Image,
    theme: FillButtonTheme,
    font: Font,
    width: CGFloat? = nil,
    height: CGFloat? = nil,
    cornerRadius: CGFloat? = nil,
    spacing: CGFloat = 8,
    animated: Bool = true,
    action: @escaping () -> Void
  ) {
    self.title = title
    self.icon = icon
    self.theme = theme
    self.font = font
    self.width = width
    self.height = height
    self.cornerRadius = cornerRadius
    self.spacing = spacing
    self.animated = animated
    self.action = action
  }

  var body: some View {
    FillButton(
      theme: theme,
      font: font,
      width: width,
      height: height,
      cornerRadius: cornerRadius,
      animated: animated,
      action: action) {
        HStack(spacing: spacing) {
          icon
          Text(title)
        }
      }
  }
}

struct FillIconTextButton_Previews: PreviewProvider {
  static let preview: some View = FillIconTextButton(
    "FillIconTextButton",
    icon: .magnifyingglass,
    theme: .primary,
    font: .body) {}

  static var previews: some View {
    preview
      .previewLayout(.fixed(width: 200, height: 70))
      .preferredColorScheme(.light)

    preview
      .previewLayout(.fixed(width: 200, height: 70))
      .preferredColorScheme(.dark)
  }
}
