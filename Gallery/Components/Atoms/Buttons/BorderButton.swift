//
//  BorderButton.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/05/19.
//

import SwiftUI

// MARK: - Themes
enum BorderButtonTheme {
  case primary

  var borderColor: Color {
    switch self {
    case .primary: return .primaryRed
    }
  }
  var backgroundColor: Color {
    switch self {
    case .primary: return .clear
    }
  }
  var foregroundColor: Color {
    switch self {
    case .primary: return .primaryRed
    }
  }
}

// MARK: - Border Button
struct BorderButton<Label: View>: View {
  @Environment(\.isEnabled) var isEnabled: Bool

  private let theme: BorderButtonTheme
  private let font: Font
  private let borderWidth: CGFloat
  private let width: CGFloat
  private let height: CGFloat
  private let cornerRadius: CGFloat?
  private let animated: Bool
  private let action: () -> Void
  private let label: Label

  init(
    theme: BorderButtonTheme,
    font: Font,
    borderWidth: CGFloat = 1,
    width: CGFloat = .infinity,
    height: CGFloat,
    cornerRadius: CGFloat? = nil,
    animated: Bool = true,
    action: @escaping () -> Void,
    @ViewBuilder label: () -> Label
  ) {
    self.theme = theme
    self.font = font
    self.borderWidth = borderWidth
    self.width = width
    self.height = height
    self.cornerRadius = cornerRadius
    self.animated = animated
    self.action = action
    self.label = label()
  }

  var body: some View {
    let label = label
      .frame(maxWidth: width, maxHeight: height)
      .background(theme.backgroundColor)
      .foregroundColor(isEnabled ? theme.foregroundColor : Color.gray)
      .font(font)

    if let cornerRadius = cornerRadius {
      Button(action: action) {
        label.overlay(
          RoundedRectangle(cornerRadius: cornerRadius)
            .stroke(isEnabled ? theme.borderColor : Color.gray, lineWidth: borderWidth)
        )
      }
      .buttonStyle(AnimationButtonStyle(animated: animated))
    } else {
      Button(action: action) {
        label.overlay(
          Capsule()
            .stroke(isEnabled ? theme.borderColor : Color.gray, lineWidth: borderWidth)
        )
      }
      .buttonStyle(AnimationButtonStyle(animated: animated))
    }
  }
}

// MARK: - Preview
struct BorderButton_Previews: PreviewProvider {
  static let preview: some View = BorderButton(theme: .primary, font: .body, width: 140, height: 40, action: {}) {
    Text("BorderButton")
  }
  static var previews: some View {
    preview
      .previewLayout(.fixed(width: 200, height: 70))
      .preferredColorScheme(.light)

    preview
      .previewLayout(.fixed(width: 200, height: 70))
      .preferredColorScheme(.dark)
  }
}
