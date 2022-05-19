//
//  FillButton.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/05/18.
//

import SwiftUI

// MARK: - Themes
enum FillButtonTheme {
  case primary
  case monotone
  case custom(
    backgroundColor: Color,
    foregroundColor: Color
  )

  var backgroundColor: Color {
    switch self {
    case .primary: return .primaryRed
    case .monotone: return .buttonSecondary
    case .custom(let color, _): return color
    }
  }
  var foregroundColor: Color {
    switch self {
    case .primary: return .white
    case .monotone: return .label
    case .custom(_, let color): return color
    }
  }
}

// MARK: - Fill Button
struct FillButton<Label: View>: View {
  @Environment(\.isEnabled) var isEnabled: Bool

  private let theme: FillButtonTheme
  private let font: Font
  private let width: CGFloat?
  private let height: CGFloat?
  private let cornerRadius: CGFloat?
  private let animated: Bool
  private let action: () -> Void
  private let label: Label

  init(
    theme: FillButtonTheme,
    font: Font,
    width: CGFloat? = nil,
    height: CGFloat? = nil,
    cornerRadius: CGFloat? = nil,
    animated: Bool = true,
    action: @escaping () -> Void,
    @ViewBuilder label: () -> Label
  ) {
    self.theme = theme
    self.font = font
    self.width = width
    self.height = height
    self.cornerRadius = cornerRadius
    self.animated = animated
    self.action = action
    self.label = label()
  }

  var body: some View {
    let label = label
      .padding()
      .frame(maxWidth: width, maxHeight: height)
      .background(isEnabled ? theme.backgroundColor : .gray)
      .foregroundColor(theme.foregroundColor)
      .font(font)

    if let cornerRadius = cornerRadius {
      Button(action: action) {
        label.clipShape(RoundedRectangle(cornerRadius: cornerRadius))
      }
      .buttonStyle(AnimationButtonStyle(animated: animated))
    } else {
      Button(action: action) {
        label.clipShape(Capsule())
      }
      .buttonStyle(AnimationButtonStyle(animated: animated))
    }
  }
}

// MARK: - preview
struct FillButton_Previews: PreviewProvider {
  static let button: some View = FillButton(theme: .primary, font: .body.bold(), width: 140, height: 40, action: {}) {
    Text("Fill Button")
  }

  static var previews: some View {
    button
      .previewLayout(.fixed(width: 200, height: 70))
      .preferredColorScheme(.light)
    button
      .previewLayout(.fixed(width: 200, height: 70))
      .preferredColorScheme(.dark)
  }
}
