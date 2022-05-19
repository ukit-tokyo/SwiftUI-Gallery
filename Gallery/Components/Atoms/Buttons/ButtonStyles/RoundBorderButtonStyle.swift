//
//  RoundBorderButtonStyle.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/05/17.
//

import SwiftUI

/// 枠線、角丸ボタンスタイル
struct RoundBorderButtonStyle: ButtonStyle {
  struct Config {
    let backgroundColor: Color
    let foregroundColor: Color
    let borderColor: Color
    let borderWidth: CGFloat
    let font: Font
    let radius: CGFloat
    let animated: Bool

    init(
      backgroundColor: Color = .clear,
      foregroundColor: Color = .primaryRed,
      borderColor: Color = .primaryRed,
      borderWidth: CGFloat = 2,
      font: Font,
      radius: CGFloat,
      animated: Bool = true
    ) {
      self.backgroundColor = backgroundColor
      self.foregroundColor = foregroundColor
      self.borderColor = borderColor
      self.borderWidth = borderWidth
      self.font = font
      self.radius = radius
      self.animated = animated
    }
  }

  private let config: Config
  @Environment(\.isEnabled) var isEnabled: Bool

  init(_ config: Config) {
    self.config = config
  }

  func makeBody(configuration: Configuration) -> some View {
    let animateScale: CGFloat = config.animated ? 0.95 : 1
    let animateDuration: Double = config.animated ? 0.2 : 0

    configuration.label
      .padding()
      .background(config.backgroundColor)
      .foregroundColor(isEnabled ? config.foregroundColor : Color.gray)
      .font(config.font)
      .overlay(
        RoundedRectangle(cornerRadius: config.radius)
          .stroke(isEnabled ? config.borderColor : Color.gray, lineWidth: config.borderWidth)
      )
      .scaleEffect(configuration.isPressed ? animateScale : 1)
      .animation(.easeOut(duration: animateDuration))
  }
}

struct RoundBorderButtonStyle_Previews: PreviewProvider {
  static let button: some View = Button("Round Border") {}
    .buttonStyle(RoundBorderButtonStyle(
      .init(font: .body.bold(), radius: 10)
    ))

  static var previews: some View {
    button
      .previewLayout(.fixed(width: 200, height: 70))
      .preferredColorScheme(.light)

    button
      .previewLayout(.fixed(width: 200, height: 70))
      .preferredColorScheme(.dark)
  }
}
