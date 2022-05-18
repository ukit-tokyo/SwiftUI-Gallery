//
//  RoundFillButtonStyle.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/05/17.
//

import SwiftUI

/// 塗り、角丸ボタンスタイル
struct RoundFillButtonStyle: ButtonStyle {
  struct Config {
    let backgroundColor: Color
    let foregroundColor: Color
    let font: Font
    let radius: CGFloat
    let animated: Bool
    
    init(
      backgroundColor: Color = .primaryRed,
      foregroundColor: Color = .white,
      font: Font,
      radius: CGFloat,
      animated: Bool = true
    ) {
      self.backgroundColor = backgroundColor
      self.foregroundColor = foregroundColor
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
    
    return configuration.label
      .padding()
      .background(isEnabled ? config.backgroundColor : Color.gray)
      .foregroundColor(config.foregroundColor)
      .font(config.font)
      .clipShape(RoundedRectangle(cornerRadius: config.radius))
      .scaleEffect(configuration.isPressed ? animateScale : 1)
      .animation(.easeOut(duration: animateDuration))
  }
}

struct RoundFillButtonStyle_Previews: PreviewProvider {
  static let roundButton: some View = Button("Round Fill") {}
    .buttonStyle(RoundFillButtonStyle(
      .init(font: .body.bold(), radius: 10)
    ))
  static var previews: some View {
    roundButton
      .previewLayout(.fixed(width: 200, height: 70))
      .preferredColorScheme(.light)
    
    roundButton
      .previewLayout(.fixed(width: 200, height: 70))
      .preferredColorScheme(.dark)
  }
}
