//
//  PagerCard.swift
//  Gallery
//
//  Created by Taichi Yuki on 2024/08/13.
//

import SwiftUI

struct PagerCard: View {
  @State var currentStep: Int = 1
  let stepCount: Int = 3

  var body: some View {
    VStack(alignment: .center, spacing: 16) {
      HStack {
        Button {
          print("close")
        } label: {
          Image(systemName: "xmark")
            .resizable()
            .foregroundColor(.black)
            .frame(width: 20, height: 20)
        }
        Spacer()
      }

      VStack(spacing: 0) {
        Text("Header")
          .typography(.subBodyBold)
        Text("Main Title")
          .typography(.display)
      }

      Image("")
        .resizable()
        .aspectRatio(311/175, contentMode: .fit)
        .background(.gray.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 8))

      Text("This is description. This is description. This is description. This is description. ")
        .typography(.subBodyBold)
        .lineLimit(nil)
        .multilineTextAlignment(.center)

      FlatGaugeIndicator(height: 6, stepCount: 3, step: currentStep)
        .frame(maxWidth: 136)
        .padding(.vertical, 18)

      FillButton(theme: .primary, font: .system(size: 16).bold()) {
        next()
      } label: {
        Text("NEXT")
          .frame(maxWidth: .infinity)
      }
      .frame(maxHeight: 48)
    }
    .padding(16)
  }

  private func next() {
    guard currentStep < stepCount else { return }

    withAnimation(.easeInOut) {
      currentStep += 1
    }
  }
}

@available(iOS 17.0, *)
#Preview(traits: .sizeThatFitsLayout) {
  PagerCard()
}
