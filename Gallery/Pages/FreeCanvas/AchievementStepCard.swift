//
//  AchievementStepCard.swift
//  Gallery
//
//  Created by Taichi Yuki on 2024/08/06.
//

import SwiftUI

struct AchievementStepCard: View {
  var body: some View {
    VStack(spacing: 12) {

      HStack(spacing: 8) {
        VStack(alignment: .leading, spacing: 0) {
          Text("SARAHへようこそ👋")
            .typography(font: .boldSystemFont(ofSize: 16), lineHeight: 24)
            .foregroundStyle(.red)
          Text("楽しみ方を覚えてUMEをゲットしよう！")
            .typography(font: .systemFont(ofSize: 12), lineHeight: 16)
            .foregroundStyle(.black)
          Text("完了まで: 0/3")
            .typography(font: .boldSystemFont(ofSize: 12), lineHeight: 30)
            .foregroundStyle(.gray)
        }

        CompleteButton()
      }
      .padding(.horizontal, 16)

      Divider()
        .frame(maxWidth: .infinity)
        .background(.gray)

      HStack(alignment: .center, spacing: 12) {
        VStack(spacing: 0) {
          Image("")
            .resizable()
            .frame(width: 20, height: 20)
            .background(.gray)
            .clipShape(Circle())
          Text("20")
            .typography(font: .boldSystemFont(ofSize: 12), lineHeight: 16)
            .foregroundStyle(.black)
        }

        VStack(alignment: .leading, spacing: 0) {
          Text("食べたいを5回しよう！")
            .typography(font: .boldSystemFont(ofSize: 14), lineHeight: 20)
            .foregroundStyle(.black)
          HStack {
            ProgressView(value: 0.5)
              .tint(.red)
              .scaleEffect(x: 1, y: 2)
            // TODO: progress animation
//              .onAppear {
//                withAnimation(.easeOut(duration: 2)) {
//                  progress = 0.5
//                }
//              }
            Text("1/5")
              .typography(font: .systemFont(ofSize: 14), lineHeight: 20)
              .foregroundStyle(.gray)
          }
        }

        FillTextButton("トライ", theme: .custom(backgroundColor: .black, foregroundColor: .white), font: .system(size: 12).bold(), height: 24) {
          print("try it!")
        }
        .padding(0)
      }
      .padding(.horizontal, 16)
    }
    .fixedSize()
    .padding(.vertical, 12)
    .background(.gray.opacity(0.1))
    .clipShape(RoundedRectangle(cornerRadius: 10))
  }
}

extension AchievementStepCard {
  private struct CompleteButton: View {
    var body: some View {
      VStack(spacing: 4) {
        Text("すべて完了")
          .typography(font: .boldSystemFont(ofSize: 10), lineHeight: 12)
          .foregroundStyle(.gray)
        Image("")
          .resizable()
          .frame(width: 24, height: 24)
          .background(.gray)
          .clipShape(Circle())
        Text("30")
          .typography(font: .boldSystemFont(ofSize: 10), lineHeight: 16)
          .foregroundStyle(.gray)
      }
      .padding(8)
      .background(.white)
      .clipShape(RoundedRectangle(cornerRadius: 8))
    }
  }
}

// MARK: -

struct TypographyModifier: ViewModifier {
  let font: UIFont
  let lineHeight: CGFloat

  func body(content: Content) -> some View {
    content
      .font(Font(font))
      .lineSpacing(lineHeight - font.lineHeight)
      .padding(.vertical, (lineHeight - font.lineHeight) / 2)
  }
}

extension View {
  func typography(font: UIFont, lineHeight: CGFloat) -> some View {
    ModifiedContent(
      content: self,
      modifier: TypographyModifier(font: font, lineHeight:  lineHeight)
    )
  }
}

// MARK: -

#Preview {
  AchievementStepCard()
}
