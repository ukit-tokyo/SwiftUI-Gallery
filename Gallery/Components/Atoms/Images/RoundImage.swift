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

  init(
    _ image: Image,
    radius: CGFloat,
    sideLength: CGFloat? = nil,
    size: CGSize? = nil,
    backgroundColor: Color? = nil
  ) {
    self.image = image
    self.radius = radius
    self.backgroundColor = backgroundColor
    self.width = sideLength ?? size?.width ?? 0
    self.height = sideLength ?? size?.height ?? 0
  }

  var body: some View {
    image
      .resizable()
      .scaledToFill()
      .frame(width: width, height: height)
      .background(backgroundColor)
      .clipShape(RoundedRectangle(cornerRadius: radius))
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

