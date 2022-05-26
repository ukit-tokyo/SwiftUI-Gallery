//
//  RoundImage.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/05/26.
//

import SwiftUI

struct RoundImage: View {
  private let image: Image
  private let radius: CGFloat
  private let width: CGFloat
  private let height: CGFloat
  private let backgroundColor: Color?
  private let tapAction: (() -> Void)

  init(
    _ image: Image,
    radius: CGFloat,
    sideLength: CGFloat? = nil,
    size: CGSize? = nil,
    backgroundColor: Color? = nil,
    tapAction: (() -> Void)? = nil
  ) {
    self.image = image
    self.radius = radius
    self.width = sideLength ?? size?.width ?? 0
    self.height = sideLength ?? size?.height ?? 0
    self.backgroundColor = backgroundColor
    self.tapAction = tapAction ?? {}
  }

  var body: some View {
    Button(action: tapAction) {
      image
        .renderingMode(.original)
        .resizable()
        .scaledToFill()
        .frame(width: width, height: height)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: radius))
    }
    .buttonStyle(.plain)
  }
}

struct RoundImage_Previews: PreviewProvider {
  static var previews: some View {
    RoundImage(.swift, radius: 10, sideLength: 60, backgroundColor: .green)
      .previewLayout(.fixed(width: 200, height: 70))

    RoundImage(.swift, radius: 10, size: CGSize(width: 180, height: 60), backgroundColor: .green)
      .previewLayout(.fixed(width: 200, height: 70))
  }
}

