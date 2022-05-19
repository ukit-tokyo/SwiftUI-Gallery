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
  case monotone
  case custom(
    borderColor: Color,
    backgroundColor: Color,
    foregroundColor: Color,
    selectedBackgroundColor: Color,
    selectedForegroundColor: Color
  )

  var borderColor: Color {
    switch self {
    case .primary: return .primaryRed
    case .monotone: return .label
    case .custom(let color, _, _, _, _): return color
    }
  }
  var backgroundColor: Color {
    switch self {
    case .primary: return .clear
    case .monotone: return .clear
    case .custom(_, let color, _, _, _): return color
    }
  }
  var foregroundColor: Color {
    switch self {
    case .primary: return .primaryRed
    case .monotone: return .label
    case .custom(_, _, let color, _, _): return color
    }
  }
  var selectedBackgroundColor: Color {
    switch self {
    case .primary: return .primaryRed
    case .monotone: return .label
    case .custom(_, _, _, let color, _): return color
    }
  }
  var selectedForegroundColor: Color {
    switch self {
    case .primary: return .white
    case .monotone: return .backgroundView
    case .custom(_, _, _, _, let color): return color
    }
  }
}

// MARK: - Border Button
struct BorderButton<Label: View>: View {
  @Environment(\.isEnabled) var isEnabled: Bool

  private let theme: BorderButtonTheme
  private let font: Font
  private let borderWidth: CGFloat
  private let width: CGFloat?
  private let height: CGFloat?
  private let cornerRadius: CGFloat?
  private let selectable: Bool
  private let animated: Bool
  private let action: (Bool) -> Void
  private let label: Label

  @State private var isSelected: Bool = false

  init(
    theme: BorderButtonTheme,
    font: Font,
    borderWidth: CGFloat = 1,
    width: CGFloat? = nil,
    height: CGFloat? = nil,
    cornerRadius: CGFloat? = nil,
    selectable: Bool = false,
    animated: Bool = true,
    action: @escaping (Bool) -> Void,
    @ViewBuilder label: () -> Label
  ) {
    self.theme = theme
    self.font = font
    self.borderWidth = borderWidth
    self.width = width
    self.height = height
    self.cornerRadius = cornerRadius
    self.selectable = selectable
    self.animated = animated
    self.action = action
    self.label = label()
  }

  var body: some View {
    let bgColor = selectable && isSelected
    ? theme.selectedBackgroundColor
    : theme.backgroundColor
    let fgColor = selectable && isSelected
    ? theme.selectedForegroundColor
    : theme.foregroundColor

    let label = label
      .padding()
      .frame(maxWidth: width, maxHeight: height)
      .background(bgColor)
      .foregroundColor(isEnabled ? fgColor : Color.gray)
      .font(font)

    if let cornerRadius = cornerRadius {
      Button(action: {
        isSelected.toggle()
        action(isSelected)
      }) {
        label
          .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
          .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
              .stroke(isEnabled ? theme.borderColor : Color.gray, lineWidth: borderWidth)
          )
      }
      .buttonStyle(AnimationButtonStyle(animated: animated))
    } else {
      Button(action: {
        isSelected.toggle()
        action(isSelected)
      }) {
        label
          .clipShape(Capsule())
          .overlay(
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
  static let preview: some View = BorderButton(theme: .primary, font: .body, width: 140, height: 40, action: { _ in }) {
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
