//
//  RoundFillButtonStyle.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/05/17.
//

import SwiftUI

/// 塗り、角丸ボタンスタイル
struct RoundFillButtonStyle<S: Shape>: ButtonStyle {
  struct Config {
    let backgroundColor: Color
    let foregroundColor: Color
    let font: Font
    let animated: Bool
    
    init(
      backgroundColor: Color = .primary,
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
  private let shape: S
  @Environment(\.isEnabled) var isEnabled: Bool
  
  init(_ config: Config, shape: S) {
    self.config = config
    self.shape = shape
  }
  
  func makeBody(configuration: Configuration) -> some View {
    let animateScale: CGFloat = config.animated ? 0.95 : 1
    let animateDuration: Double = config.animated ? 0.2 : 0
    
    return configuration.label
      .padding()
      .background(isEnabled ? config.backgroundColor : Color.gray)
      .foregroundColor(config.foregroundColor)
      .font(config.font)
      .clipShape(shape)
      .scaleEffect(configuration.isPressed ? animateScale : 1)
      .animation(.easeOut(duration: animateDuration))
  }
}

struct RoundFillButtonStyle_Previews: PreviewProvider {
  static let roundButton: some View = Button("Round Fill") {}
    .buttonStyle(RoundFillButtonStyle(
      .init(font: .body.bold()),
      shape: RoundedRectangle(cornerRadius: 10)
    ))
  static let capsuleButton: some View = Button("Capsule Fill") {}
    .buttonStyle(RoundFillButtonStyle(
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