//
//  CapsuleFillButtonStyle.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/05/18.
//

import SwiftUI

/// 塗り、角が円のボタンスタイル
struct CapsuleFillButtonStyle: ButtonStyle {
  struct Config {
    let backgroundColor: Color
    let foregroundColor: Color
    let font: Font
    let animated: Bool

    init(
      backgroundColor: Color = .primaryRed,
      foregroundColor: Color = .white,
      font: Font,
      animated: Bool = true
    ) {
      self.backgroundColor = backgroundColor
      self.foregroundColor = foregroundColor
      self.font = font
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

    return configuration.label
      .padding()
      .background(isEnabled ? config.backgroundColor : Color.gray)
      .foregroundColor(config.foregroundColor)
      .font(config.font)
      .clipShape(Capsule())
      .scaleEffect(configuration.isPressed ? animateScale : 1)
      .animation(.easeOut(duration: animateDuration))
  }
}

struct CapsuleFillButtonStyle_Previews: PreviewProvider {
  static let button: some View = Button("Capsule Fill") {}
    .buttonStyle(CapsuleFillButtonStyle(
      .init(font: .body.bold())
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
