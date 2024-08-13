//
//  FlatPageIndicator.swift
//  Gallery
//
//  Created by Taichi Yuki on 2024/08/13.
//

import SwiftUI

struct FlatGaugeIndicator: View {
  let height: CGFloat
  let stepCount: Int
  let step: Int

  @State private var totalWidth: CGFloat = .zero
  private var offsetX: CGFloat {
    (totalWidth / CGFloat(stepCount)) * CGFloat(step)
  }

  var body: some View {
    ZStack(alignment: .leading) {
      Capsule()
        .fill(.gray.opacity(0.2))
        .frame(maxHeight: height)
        .background(
          GeometryReader { geometry in
            Capsule()
              .fill(.clear)
              .frame(width: geometry.size.width, height: geometry.size.height)
              .onAppear {
                totalWidth = geometry.size.width
              }
          }
        )

      Capsule()
        .fill(.black)
        .frame(width: totalWidth / CGFloat(stepCount), height: height)
        .offset(x: offsetX)
    }
    .frame(maxWidth: .infinity)
    .mask {
      HStack(spacing: 8) {
        ForEach(0..<stepCount, id: \.self) { _ in
          Capsule().frame(height: height)
        }
      }
    }
  }
}

@available(iOS 17.0, *)
#Preview(traits: .sizeThatFitsLayout) {
  FlatGaugeIndicator(height: 8, stepCount: 3, step: 0)
    .padding()
}
