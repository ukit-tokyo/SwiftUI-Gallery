//
//  RoundBorderButtonStyle.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/05/17.
//

import SwiftUI

/// 枠線、角丸ボタンスタイル
struct RoundBorderButtonStyle<S: Shape>: ButtonStyle {
  struct Config {
    let backgroundColor: Color
    let foregroundColor: Color
    let borderColor: Color
    let borderWidth: CGFloat
    let font: Font
    let animated: Bool

    init(
      backgroundColor: Color = .clear,
      foregroundColor: Color = .primary,
      borderColor: Color = .primary,
      borderWidth: CGFloat = 2,
      font: Font,
      animated: Bool = true
    ) {
      self.backgroundColor = backgroundColor
      self.foregroundColor = foregroundColor
      self.borderColor = borderColor
      self.borderWidth = borderWidth
      self.font = font
      self.animated = animated
    }
  }

  private let config: Config
  private let shape: S
  @Environment(\.isEnabled) var isEnabled: Bool

  init(_ config: Config, shape: S) {
    self.config = config
    self.shape = shape
  }

  func makeBody(configuration: Configuration) -> some View {
    let animateScale: CGFloat = config.animated ? 0.95 : 1
    let animateDuration: Double = config.animated ? 0.2 : 0

    configuration.label
      .padding()
      .background(config.backgroundColor)
      .foregroundColor(isEnabled ? config.foregroundColor : Color.gray)
      .font(config.font)
      .overlay(shape.stroke(isEnabled ? config.borderColor : Color.gray, lineWidth: config.borderWidth))
      .scaleEffect(configuration.isPressed ? animateScale : 1)
      .animation(.easeOut(duration: animateDuration))
  }
}

struct RoundBorderButtonStyle_Previews: PreviewProvider {
  static let roundButton: some View = Button("Round Border") {}
    .buttonStyle(RoundBorderButtonStyle(
      .init(font: .body.bold()),
      shape: RoundedRectangle(cornerRadius: 10)
    ))
  static let capsuleButton: some View = Button("Capsule Border") {}
    .buttonStyle(RoundBorderButtonStyle(
      .init(font: .body.bold()),
      shape: Capsule()
    ))

  static var previews: some View {
    Group {
      roundButton
      capsuleButton
    }
    .previewLayout(.fixed(width: 200, height: 70))
    .preferredColorScheme(.light)

    Group {
      roundButton
      capsuleButton
    }
    .previewLayout(.fixed(width: 200, height: 70))
    .preferredColorScheme(.dark)
  }
}
