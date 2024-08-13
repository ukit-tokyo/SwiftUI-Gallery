//
//  PagerCard.swift
//  Gallery
//
//  Created by Taichi Yuki on 2024/08/13.
//

import SwiftUI

struct PagerCard: View {
  var body: some View {
    VStack(alignment: .center, spacing: 16) {
      HStack {
        Button {
          print("testing___close")
        } label: {
          Image(systemName: "xmark")
            .resizable()
            .foregroundColor(.black)
            .frame(width: 20, height: 20)
        }
        Spacer()
      }

      VStack(spacing: 0) {
        Text("SARAHの楽しみ方")
          .typography(.subBodyBold)
        Text("「おいしい！」を記録する")
          .typography(.display)
      }

      Image(.star)
        .resizable()
        .aspectRatio(311/175, contentMode: .fit)
        .clipShape(RoundedRectangle(cornerRadius: 8))

      Text("SARAHへようこそ👋 まずはあなたが出会った「おいしい！」を記録しましょう 📸")
        .typography(.subBodyBold)
        .lineLimit(nil)
        .multilineTextAlignment(.center)



      FillButton(theme: .primary, font: .system(size: 16).bold()) {
        print("testing___fillbutton")
      } label: {
        Text("次へ")
          .frame(maxWidth: .infinity)
      }
      .frame(maxHeight: 48)

//      Spacer()
    }
    .padding(16)
  }
}

@available(iOS 17.0, *)
#Preview(traits: .sizeThatFitsLayout) {
  PagerCard()
}
