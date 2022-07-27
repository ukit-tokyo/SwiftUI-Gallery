//
//  RatingScoreStarView.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/07/27.
//

import SwiftUI

struct RatingScoreStarView: View {
  @Binding var value: Float

  let iconSize: Float
  let iconPadding: Float
  let viewSpacing: CGFloat
  let onSlided: ((Float) -> ())?

  init(
    value: Binding<Float>,
    iconSize: Float,
    iconPadding: Float,
    viewSpacing: CGFloat,
    onSlided: ((Float) -> ())? = nil
  ) {
    self._value = value
    self.iconSize = iconSize
    self.iconPadding = iconPadding
    self.viewSpacing = viewSpacing
    self.onSlided = onSlided
  }

  var body: some View {
    HStack(alignment: .center, spacing: viewSpacing) {
      RatingStarView(
        value: $value,
        iconSize: iconSize,
        padding: iconPadding,
        onSlided: onSlided
      )
      .frame(maxWidth: 182, maxHeight: 30, alignment: .center) // TODO: self sizing

      Text(String(value))
        .font(.largeBold)
    }
  }
}

//struct RatingScoreStarView_Previews: PreviewProvider {
//  static var previews: some View {
//    RatingScoreStarView()
//  }
//}
