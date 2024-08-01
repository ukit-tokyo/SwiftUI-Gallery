//
//  GradientBorderAnimationsView.swift
//  Gallery
//
//  Created by Taichi Yuki on 2024/08/01.
//

import SwiftUI

struct GradientBorderAnimationsView: View {

  @State var rotation: CGFloat = 0

  var body: some View {
    ZStack {
      Color.gray.ignoresSafeArea()
      RoundedRectangle(cornerRadius: 20, style: .continuous)
        .frame(width: 200, height: 250)
        .foregroundStyle(.black)
        .shadow(color: .black.opacity(0.5), radius: 10, x: 0.0, y: 10)

      RoundedRectangle(cornerRadius: 20, style: .continuous)
        .frame(width: 500, height: 150)
        .foregroundStyle(
          LinearGradient(
            gradient: Gradient(
              colors: [
                .blue.opacity(0.01), 
                .blue,
                .blue,
                .blue.opacity(0.01),
              ]
            ),
            startPoint: .top,
            endPoint: .bottom
          )
        )
        .rotationEffect(.degrees(rotation))
        .mask {
          RoundedRectangle(cornerRadius: 19, style: .continuous)
            .stroke(lineWidth: 2)
            .frame(width: 198.5, height: 248.5)
        }

      Text("CARD")
        .foregroundStyle(.white)
        .bold()
        .font(.largeTitle)
    }
    .onAppear {
      withAnimation(.linear(duration: 4).repeatForever(autoreverses: false)) {
        rotation = 360
      }
    }
  }
}

#Preview {
  GradientBorderAnimationsView()
}
