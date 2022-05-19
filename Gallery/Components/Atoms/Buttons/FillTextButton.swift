//
//  FillTextButton.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/05/19.
//

import SwiftUI

struct FillTextButton: View {
  @Environment(\.isEnabled) var isEnabled: Bool

  private let title: String
  private let theme: FillButtonTheme
  private let font: Font
  private let width: CGFloat?
  private let height: CGFloat?
  private let cornerRadius: CGFloat?
  private let animated: Bool
  private let action: () -> Void

  init(
    _ title: String,
    theme: FillButtonTheme,
    font: Font,
    width: CGFloat? = nil,
    height: CGFloat? = nil,
    cornerRadius: CGFloat? = nil,
    animated: Bool = true,
    action: @escaping () -> Void
  ) {
    self.title = title
    self.theme = theme
    self.font = font
    self.width = width
    self.height = height
    self.cornerRadius = cornerRadius
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
        Text(title)
      }
  }
}

struct FillTextButton_Previews: PreviewProvider {
  static var previews: some View {
    FillTextButton("FillTextButton", theme: .primary, font: .body.bold(), height: 40) {}
      .previewLayout(.fixed(width: 200, height: 70))
      .preferredColorScheme(.light)

    FillTextButton("FillTextButton", theme: .primary, font: .body.bold(), height: 40) {}
      .previewLayout(.fixed(width: 200, height: 70))
      .preferredColorScheme(.dark)
  }
}
