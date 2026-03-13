//
//  CanvasView.swift
//  Gallery
//
//  Created by Taichi Yuki on 2026/02/10.
//

import SwiftUI

struct CanvasView: View {
  var body: some View {
    VStack(spacing: 32) {
      Text("メニュー名が分からなくてもご安心ください")
        .typography(.display)
        .foregroundStyle(.black)
        .multilineTextAlignment(.center)

      HintCard()
        .frame(maxWidth: .infinity)
    }
    .padding(32)
  }
}

struct HintCard: View {
  let tags = [
    "4種チーズのピザ",
    "炙りしめ鯖",
    "名物つくね",
  ]

  var body: some View {
    HStack(alignment: .top, spacing: 16) {
      ZStack {
        Color.white
          .clipShape(Circle())
          .frame(width: 40, height: 40)
        Image(systemName: "pencil")
          .resizable()
          .foregroundStyle(.red)
          .frame(width: 20, height: 20)
      }

      VStack(alignment: .leading, spacing: 8) {
        Text("正式名称でなくてOK")
          .font(.system(size: 16, weight: .bold))
        Text("通称やジャンル名での登録も大歓迎です")
          .font(.system(size: 14))

        FlowLayout(spacing: 8) {
          ForEach(tags, id: \.self) { text in
            Text(text)
              .font(.caption)
              .foregroundStyle(Color(.red))
              .lineLimit(1)
              .padding(.horizontal, 12)
              .padding(.vertical, 8)
              .background(
                Capsule()
                  .fill(.red.opacity(0.1))
              )
          }
        }
      }
    }
    .padding()
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(Color.red.opacity(0.04))
    )
  }
}

#Preview {
  CanvasView()
}
