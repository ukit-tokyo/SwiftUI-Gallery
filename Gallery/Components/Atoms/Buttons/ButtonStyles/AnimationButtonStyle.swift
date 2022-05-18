//
//  AnimationButtonStyle.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/05/18.
//

import SwiftUI

struct AnimationButtonStyle: ButtonStyle {
  let animated: Bool

  func makeBody(configuration: Configuration) -> some View {
    let animateScale: CGFloat = animated ? 0.95 : 1
    let animateDuration: Double = animated ? 0.2 : 0

    configuration.label
      .scaleEffect(configuration.isPressed ? animateScale : 1)
      .animation(.easeOut(duration: animateDuration))
  }
}
