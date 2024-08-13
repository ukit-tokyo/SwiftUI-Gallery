//
//  AchievementStepCard.swift
//  Gallery
//
//  Created by Taichi Yuki on 2024/08/06.
//

import SwiftUI

struct FreshersTaskCard: View {
  let title: String
  let description: String
  let totalProgress: (value: Int, total: Int)
  let reward: Int
  let taskTitle: String
  let taskReward: Int
  let taskProgress: (value: Int, total: Int)

  var allAchieved: Bool { totalProgress.value >= totalProgress.total }

  var body: some View {
    VStack(spacing: 12) {

      HStack(spacing: 8) {
        VStack(alignment: .leading, spacing: 0) {
          Text(title)
            .typography(font: .boldSystemFont(ofSize: 16), lineHeight: 24)
            .foregroundStyle(.red)
          Text(description)
            .typography(font: .systemFont(ofSize: 12), lineHeight: 16)
            .lineLimit(2)
            .foregroundStyle(.black)
          if !allAchieved {
            Text("完了まで: \(totalProgress.value)/\(totalProgress.total)")
              .typography(font: .boldSystemFont(ofSize: 12), lineHeight: 30)
              .foregroundStyle(.gray)
          }
        }

        Spacer()

        CompleteButton(reward: reward, achieved: allAchieved)
      }
      .padding(.horizontal, 16)

      if !allAchieved {
        Divider()
          .frame(maxWidth: .infinity)
          .background(.gray)

        TaskCard(
          title: taskTitle,
          reward: taskReward,
          progress: taskProgress
        )
      }
    }
    .padding(.vertical, 12)
    .background(.gray.opacity(0.1))
    .clipShape(RoundedRectangle(cornerRadius: 10))
  }
}

extension FreshersTaskCard {
  private struct CompleteButton: View {
    let reward: Int
    let achieved: Bool

    var body: some View {
      ZStack {
        VStack(spacing: 2) {
          Text("すべて完了")
            .typography(font: .boldSystemFont(ofSize: 10), lineHeight: 12)
            .foregroundStyle(achieved ? .white : .gray)

          VStack(spacing: 0) {
            Image("")
              .resizable()
              .frame(width: 24, height: 24)
              .background(.gray)
              .clipShape(Circle())
            Text(String(reward))
              .typography(font: .boldSystemFont(ofSize: 10), lineHeight: 16)
              .foregroundStyle(achieved ? .black : .gray)
          }
          .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
          .background(.white)
          .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        .padding(8)
        .background(achieved ? .red : .white)

        if !achieved {
          RoundedRectangle(cornerRadius: 8)
            .stroke(style: StrokeStyle(lineWidth: 1, dash: [4, 4]))
            .foregroundStyle(.gray)
        }
      }
      .fixedSize()
      .clipShape(RoundedRectangle(cornerRadius: 8))
    }
  }

  private struct TaskCard: View {
    let title: String
    let reward: Int
    let progress: (value: Int, total: Int)
    var achieved: Bool { progress.value >= progress.total }

    var body: some View {
      HStack(alignment: .center, spacing: 12) {
        VStack(spacing: 0) {
          Image("")
            .resizable()
            .frame(width: 20, height: 20)
            .background(.gray)
            .clipShape(Circle())
          Text(String(reward))
            .typography(font: .boldSystemFont(ofSize: 12), lineHeight: 16)
            .foregroundStyle(.black)
        }

        VStack(alignment: .leading, spacing: 0) {
          Text(title)
            .typography(font: .boldSystemFont(ofSize: 14), lineHeight: 20)
            .foregroundStyle(.black)
          HStack {
            ProgressView(value: Float(progress.value), total: Float(progress.total))
              .tint(.red)
              .scaleEffect(x: 1, y: 2)
            // TODO: progress animation
//              .onAppear {
//                withAnimation(.easeOut(duration: 2)) {
//                  progress = 0.5
//                }
//              }
            Text("\(progress.value)/\(progress.total)")
              .typography(font: .systemFont(ofSize: 14), lineHeight: 20)
              .foregroundStyle(.gray)
          }
        }

        if achieved {
          FillTextButton("受け取る", theme: .custom(backgroundColor: .red, foregroundColor: .white), font: .system(size: 12).bold(), height: 24) {
            print("achieved!")
          }
          .padding(0)
        } else {
          FillTextButton("トライ", theme: .custom(backgroundColor: .black, foregroundColor: .white), font: .system(size: 12).bold(), height: 24) {
            print("try it!")
          }
          .padding(0)
        }
      }
      .padding(.horizontal, 16)
    }
  }
}

// MARK: -

#Preview {
  FreshersTaskCard(
    title: "ようこそ👋",
    description: "使い方を覚えてポイントをもらおう！",
    totalProgress: (value: 1, total: 3),
    reward: 30,
    taskTitle: "いいねを５回しよう",
    taskReward: 10,
    taskProgress: (value: 1, total: 5)
  )
  .padding()
}
