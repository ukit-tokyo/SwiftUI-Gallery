//
//  CircleImage.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/05/26.
//

import SwiftUI

struct CircleImage: View {
  private let image: Image
  private let diameter: CGFloat
  private let backgroundColor: Color?
  private let tapAction: (() -> Void)

  init(
    _ image: Image,
    diameter: CGFloat,
    backgroundColor: Color? = nil,
    tapAction: (() -> Void)? = nil
  ) {
    self.image = image
    self.diameter = diameter
    self.backgroundColor = backgroundColor
    self.tapAction = tapAction ?? {}
  }

  var body: some View {
    Button(action: tapAction) {
      image
        .renderingMode(.original)
        .resizable()
        .scaledToFit()
        .frame(width: diameter, height: diameter)
        .background(backgroundColor)
        .clipShape(Circle())
    }
    .buttonStyle(.plain)
  }
}

struct CircleImage_Previews: PreviewProvider {
  static var previews: some View {
    CircleImage(.swift, diameter: 50, backgroundColor: .green)
      .previewLayout(.fixed(width: 200, height: 70))
  }
}
