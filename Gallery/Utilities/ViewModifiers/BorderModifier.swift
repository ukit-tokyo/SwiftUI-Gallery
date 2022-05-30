//
//  BorderModifier.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/05/30.
//

import SwiftUI

extension View {
  func rowSeparator(
    thickness: CGFloat = 0.5,
    color: Color = .separator,
    at alignment: BorderModifier.Alignment = .bottom
  ) -> some View {
    border(thickness: thickness, color: color, at: alignment)
  }

  func border(
    thickness: CGFloat,
    color: Color,
    at alignment: BorderModifier.Alignment
  ) -> some View {
    modifier(BorderModifier(thickness: thickness, color: color, alignment: alignment))
  }
}

struct BorderModifier: ViewModifier {
  enum Alignment {
    case top, leading, trailing, bottom
  }
  private let thickness: CGFloat
  private let color: Color
  private let alignment: Alignment

  init(
    thickness: CGFloat,
    color: Color,
    alignment: Alignment
  ) {
    self.thickness = thickness
    self.color = color
    self.alignment = alignment
  }

  func body(content: Content) -> some View {
    ZStack {
      if alignment == .top || alignment == .bottom {
        VStack {
          if alignment == .bottom { Spacer() }
          Rectangle()
            .foregroundColor(color)
            .frame(maxWidth: .infinity, maxHeight: thickness)
          if alignment == .top { Spacer() }
        }
      }
      if alignment == .leading || alignment == .trailing {
        HStack {
          if alignment == .trailing { Spacer() }
          Rectangle()
            .foregroundColor(color)
            .frame(maxWidth: thickness, maxHeight: .infinity)
          if alignment == .leading { Spacer() }
        }
      }
      content
    }
  }
}


struct BorderModifier_Previews: PreviewProvider {
  static var previews: some View {
    Text("Border Modifier")
      .border(thickness: 4, color: .red, at: .bottom)
      .previewLayout(.fixed(width: 200, height: 60))
      .preferredColorScheme(.light)

    Text("Border Modifier")
      .border(thickness: 4, color: .red, at: .top)
      .previewLayout(.fixed(width: 200, height: 60))
      .preferredColorScheme(.light)

    Text("Border Modifier")
      .border(thickness: 4, color: .red, at: .leading)
      .previewLayout(.fixed(width: 200, height: 60))
      .preferredColorScheme(.light)

    Text("Border Modifier")
      .border(thickness: 4, color: .red, at: .trailing)
      .previewLayout(.fixed(width: 200, height: 60))
      .preferredColorScheme(.light)
  }
}
